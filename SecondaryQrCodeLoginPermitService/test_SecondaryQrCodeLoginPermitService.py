from SecondaryQrCodeLoginPermitService import SecondaryQrCodeLoginPermitService
from SecondaryQrCodeLoginPermitService.ttypes import *
from thrift.transport import THttpClient
from thrift.protocol import TCompactProtocol

authToken = ""
authSessionId = ""

headers = {
    "User-Agent": "Line/10.1.1",
    "X-Line-Application": "IOS\t10.1.1\tiPhone 8\t11.2.5",
    "x-lal": "en_US",
    "X-Line-Carrier": "52003",
    "X-Line-Access": authToken,
}

transport = THttpClient.THttpClient("https://ga2s.line.naver.jp/ACCT/lgn/sq/v1")
transport.setCustomHeaders(headers)
protocol = TCompactProtocol.TCompactProtocol(transport)
client = CallService.Client(protocol)
transport.open()

client.verifyQrCode(VerifyQrCodeRequest(authSessionId))
client.verifyPinCode(VerifyPinCodeRequest(authSessionId, input("PIN CODE: ")))