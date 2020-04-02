enum SecondaryQrCodeErrorCode {
    INTERNAL_ERROR = 0;
    ILLEGAL_ARGUMENT = 1;
    VERIFICATION_FAILED = 2;
    NOT_ALLOWED_QR_CODE_LOGIN = 3;
    VERIFICATION_NOTICE_FAILED = 4;
    RETRY_LATER = 5;
    INVALID_CONTEXT = 100;
    APP_UPGRADE_REQUIRED = 101;
}

exception SecondaryQrCodeException {
    1: SecondaryQrCodeErrorCode code;
    2: string alertMessage;
}

struct CancelPinCodeRequest {
    1: string authSessionId;
}

struct CancelPinCodeResponse {}

struct GetLoginActorContextRequest {
    1: string authSessionId;
}

struct GetLoginActorContextResponse {
    1: string appType;
    2: string accessLocation;
}

struct VerifyPinCodeRequest {
    1: string authSessionId;
    2: string pinCode;
}

struct VerifyPinCodeResponse {}

struct VerifyQrCodeRequest {
    1: string authSessionId;
    2: map<string, string> metaData;
}

struct VerifyQrCodeResponse {}

service SeondaryQrCodeLoginPermitService {
    VerifyQrCodeResponse verifyQrCode (
        1: VerifyQrCodeRequest request;
    ) throws(1: SecondaryQrCodeException e);
    
    GetLoginActorContextResponse getLoginActorContext (
        1: GetLoginActorContextRequest request;
    ) throws(1: SecondaryQrCodeException e);
    
    VerifyPinCodeResponse verifyPinCode (
        1: VerifyPinCodeRequest request;
    ) throws(1: SecondaryQrCodeException e);
    
    CancelPinCodeResponse cancelPinCode (
        1: CancelPinCodeRequest request;
    ) throws(1: SecondaryQrCodeException e);
}