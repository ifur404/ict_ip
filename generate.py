import os 

def localIP():
    f = open("./local_ip.bat","r")
    data = f.read()
    for x in range(111,145) :
        ip = f"192.168.0.{str(x)}"
        datatemp = data.replace("%ip%",ip)
        newfile = open(f"result/local_{str(ip)}.bat","w",encoding='utf-8')
        newfile.write(datatemp)
        newfile.close()
        print(ip)
    f.close()

def internetIP():
    f = open("./internet_ip.bat","r")
    data = f.read()
    for x in range(1,255) :
        ip = f"192.168.10.{str(x)}"
        datatemp = data.replace("%ip%",ip)
        newfile = open(f"result/internet_{str(ip)}.bat","w",encoding='utf-8')
        newfile.write(datatemp)
        newfile.close()
        print(ip)
    f.close()


if __name__ == "__main__" :
    localIP()
    internetIP()