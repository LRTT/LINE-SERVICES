from PersonaService import PersonaService
from PersonaService.ttypes import *
from thrift.transport import THttpClient
from thrift.protocol import TCompactProtocol

authToken = ""

headers = {
    "User-Agent": "Line/10.1.1",
    "X-Line-Application": "IOS\t10.1.1\tiPhone 8\t11.2.5",
    "x-lal": "en_US",
    "X-Line-Carrier": "52003",
    "X-Line-Access": authToken,
}

transport = THttpClient.THttpClient("https://ga2s.line.naver.jp/PS4")
transport.setCustomHeaders(headers)
protocol = TCompactProtocol.TCompactProtocol(transport)
client = PersonaService.Client(protocol)
transport.open()

print(client.getMoretabRecommend())