# pip install wakeonlan

from wakeonlan import send_magic_packet

#send_magic_packet('50.3E.AA.0F.D9.C3', ip_address='192.168.2.1', port=9)

send_magic_packet('50.3E.AA.0F.D9.C3')
