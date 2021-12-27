from pyrad import *
import socket
import pyrad.host
import random

BUFSIZE = 1024
KEY = b"testing123"
CHALLENGE = "test2"

class RadiusServer(pyrad.host.Host):
    def __init__(self):
        # dict = pyrad.dictionary.Dictionary("dictionary.rfc2865") #从freeradius中搞一个通用的字典使用
        dict = pyrad.dictionary.Dictionary("dictionary") #从freeradius中搞一个通用的字典使用
        pyrad.host.Host.__init__(self, dict=dict)

    def get_challenge(self): #产生一个4字节的随机挑战码
        challenge = ""
        challenge = challenge + str(chr(random.randint(65,90)))
        challenge = challenge + str(chr(random.randint(65,90)))
        challenge = challenge + str(chr(random.randint(65,90)))
        challenge = challenge + str(chr(random.randint(65,90)))
        return challenge

    def check_pass(self, radpkt, get_pw): #检查用户名密码，这里简单处理一下，如果密码是test则发起挑战，如果输入正确的挑战码，回应正确，否则失败
        global CHALLENGE
        print("check user")
        pwd = ""
		
        if 1 == get_pw:
            pwd = radpkt["User-Password"][0]	
			
            if radpkt.PwCrypt(CHALLENGE) == pwd:
                radpkt.code = packet.AccessAccept
                CHALLENGE = self.get_challenge() #挑战码使用过后就更换掉
                print("AccessAccept")
            elif radpkt.PwCrypt("test") == pwd:
                radpkt.code = packet.AccessChallenge
                CHALLENGE = self.get_challenge()
                radpkt.AddAttribute("Reply-Message", CHALLENGE) #把挑战码发给客户端
                print("AccessChallenge， please input", CHALLENGE)
            else:
                radpkt.code = packet.AccessReject
                print("AccessReject")
					
    def get_pkt(self, pkt):
        get_pw = None
        get_name = None
        radpkt = self.CreateAuthPacket(packet=pkt) #解析请求报文
        print("code:", radpkt.code)
        print("authenticator:", radpkt.authenticator)
        print("id:", radpkt.id)
        #radpkt.code = packet.AccessChallenge
        radpkt.secret = KEY

        for key in radpkt.keys():
            print(key, radpkt[key])
            if key == "User-Password":
                get_pw = 1
            if key == "User-Name":
                get_name = 1
        
        if 1 == get_pw and 1 == get_name:
            self.check_pass(radpkt, get_pw)
			
        reply = radpkt.CreateReply()
		
        for key in radpkt.keys():
            if key == "User-Name":
                reply.AddAttribute("User-Name", radpkt["User-Name"][0])

            if key == "Reply-Message":
                reply.AddAttribute("Reply-Message", radpkt["Reply-Message"][0])

            if key == "NAS-IP-Address":
                reply.AddAttribute("NAS-IP-Address", radpkt["NAS-IP-Address"][0])

            #reply.source = radpkt.source
            reply.code = radpkt.code

        return reply.ReplyPacket()

ip_port = ('', 1812)
server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # udp协议
server.bind(ip_port)


while True:
    data,client_addr = server.recvfrom(BUFSIZE)
    srv = RadiusServer()
    reply = srv.get_pkt(data)
    server.sendto(reply, client_addr)