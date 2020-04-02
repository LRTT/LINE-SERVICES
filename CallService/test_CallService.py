from CallService import CallService
from CallService.ttypes import *
from thrift.transport import THttpClient
from thrift.protocol import TCompactProtocol

authToken = ""
chatMid = ""
mid = ""

headers = {
    "User-Agent": "Line/10.1.1",
    "X-Line-Application": "IOS\t10.1.1\tiPhone 8\t11.2.5",
    "x-lal": "en_US",
    "X-Line-Carrier": "52003",
    "X-Line-Access": authToken,
}

transport = THttpClient.THttpClient("https://ga2s.line.naver.jp/V4")
transport.setCustomHeaders(headers)
protocol = TCompactProtocol.TCompactProtocol(transport)
client = CallService.Client(protocol)
transport.open()

groupCall = client.getGroupCall(chatMid)
if groupCall.hostMid == mid:
    callRoute = client.acquireGroupCallRoute(chatMid, groupCall.mediaType, True, [])
else:
    callRoute = client.acquireGroupCallRoute(chatMid, MediaType.AUDIO, False, [])
print(callRoute)