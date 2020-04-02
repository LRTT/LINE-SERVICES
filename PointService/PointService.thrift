enum PointErrorCode {
    REQUEST_DUPLICATION = 3001;
    INVALID_PARAMETER = 3002;
    NOT_ENOUGH_BALANCE = 3003;
    AUTHENTICATION_FAIL = 3004;
    API_ACCESS_FORBIDDEN = 3005;
    MEMBER_ACCOUNT_NOT_FOUND = 3006;
    SERVICE_ACCOUNT_NOT_FOUND = 3007;
    TRANSACTION_NOT_FOUND = 3008;
    ALREADY_REVERSED_TRANSACTION = 3009;
    MESSAGE_NOT_READABLE = 3010;
    HTTP_REQUEST_METHOD_NOT_SUPPORTED = 3011;
    HTTP_MEDIA_TYPE_NOT_SUPPORTED = 3012;
    NOT_ALLOWED_TO_DEPOSIT = 3013;
    NOT_ALLOWED_TO_PAY = 3014;
    TRANSACTION_ACCESS_FORBIDDEN = 3015;
    INVALID_SERVICE_CONFIGURATION = 4001;
    DCS_COMMUNICATION_FAIL = 5004;
    UPDATE_BALANCE_FAIL = 5007;
    SYSTEM_ERROR = 5999;
    SYSTEM_MAINTENANCE = 5888;
}

exception PointException {
    1: PointErrorCode code;
    2: string reason;
    3: map<string, string> extra;
}

struct GetBalanceRequest {
}

struct Balance {
	1: string currentPointsFixedPointDecimal;
}

struct GetBalanceResponse {
	1: Balance balance;
}

service PointService {
	GetBalanceResponse getBalance (
		1: GetBalanceRequest request;
	) throws(1: PointException e);
}