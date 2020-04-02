enum TalkErrorCode {
    ILLEGAL_ARGUMENT = 0;
    AUTHENTICATION_FAILED = 1;
    DB_FAILED = 2;
    INVALID_STATE = 3;
    EXCESSIVE_ACCESS = 4;
    NOT_FOUND = 5;
    INVALID_MID = 9;
    NOT_A_MEMBER = 10;
    INVALID_LENGTH = 6;
    NOT_AVAILABLE_USER = 7;
    NOT_AUTHORIZED_DEVICE = 8;
    NOT_AUTHORIZED_SESSION = 14;
    INCOMPATIBLE_APP_VERSION = 11;
    NOT_READY = 12;
    NOT_AVAILABLE_SESSION = 13;
    SYSTEM_ERROR = 15;
    NO_AVAILABLE_VERIFICATION_METHOD = 16;
    NOT_AUTHENTICATED = 17;
    INVALID_IDENTITY_CREDENTIAL = 18;
    NOT_AVAILABLE_IDENTITY_IDENTIFIER = 19;
    INTERNAL_ERROR = 20;
    NO_SUCH_IDENTITY_IDENFIER = 21;
    DEACTIVATED_ACCOUNT_BOUND_TO_THIS_IDENTITY = 22;
    ILLEGAL_IDENTITY_CREDENTIAL = 23;
    UNKNOWN_CHANNEL = 24;
    NO_SUCH_MESSAGE_BOX = 25;
    NOT_AVAILABLE_MESSAGE_BOX = 26;
    CHANNEL_DOES_NOT_MATCH = 27;
    NOT_YOUR_MESSAGE = 28;
    MESSAGE_DEFINED_ERROR = 29;
    USER_CANNOT_ACCEPT_PRESENTS = 30;
    USER_NOT_STICKER_OWNER = 32;
    MAINTENANCE_ERROR = 33;
    ACCOUNT_NOT_MATCHED = 34;
    ABUSE_BLOCK = 35;
    NOT_FRIEND = 36;
    NOT_ALLOWED_CALL = 37;
    BLOCK_FRIEND = 38;
    INCOMPATIBLE_VOIP_VERSION = 39;
    INVALID_SNS_ACCESS_TOKEN = 40;
    EXTERNAL_SERVICE_NOT_AVAILABLE = 41;
    NOT_ALLOWED_ADD_CONTACT = 42;
    NOT_CERTIFICATED = 43;
    NOT_ALLOWED_SECONDARY_DEVICE = 44;
    INVALID_PIN_CODE = 45;
    NOT_FOUND_IDENTITY_CREDENTIAL = 46;
    EXCEED_FILE_MAX_SIZE = 47;
    EXCEED_DAILY_QUOTA = 48;
    NOT_SUPPORT_SEND_FILE = 49;
    MUST_UPGRADE = 50;
    NOT_AVAILABLE_PIN_CODE_SESSION = 51;
    EXPIRED_REVISION = 52;
    NOT_YET_PHONE_NUMBER = 54;
    BAD_CALL_NUMBER = 55;
    UNAVAILABLE_CALL_NUMBER = 56;
    NOT_SUPPORT_CALL_SERVICE = 57;
    CONGESTION_CONTROL = 58;
    NO_BALANCE = 59;
    NOT_PERMITTED_CALLER_ID = 60;
    NO_CALLER_ID_LIMIT_EXCEEDED = 61;
    CALLER_ID_VERIFICATION_REQUIRED = 62;
    NO_CALLER_ID_LIMIT_EXCEEDED_AND_VERIFICATION_REQUIRED = 63;
    MESSAGE_NOT_FOUND = 64;
    INVALID_ACCOUNT_MIGRATION_PINCODE_FORMAT = 65;
    ACCOUNT_MIGRATION_PINCODE_NOT_MATCHED = 66;
    ACCOUNT_MIGRATION_PINCODE_BLOCKED = 67;
    INVALID_PASSWORD_FORMAT = 69;
    FEATURE_RESTRICTED = 70;
    MESSAGE_NOT_DESTRUCTIBLE = 71;
    PAID_CALL_REDEEM_FAILED = 72;
    PREVENTED_JOIN_BY_TICKET = 73;
    SEND_MESSAGE_NOT_PERMITTED_FROM_LINE_AT = 75;
    SEND_MESSAGE_NOT_PERMITTED_WHILE_AUTO_REPLY = 76;
    SECURITY_CENTER_NOT_VERIFIED = 77;
    SECURITY_CENTER_BLOCKED_BY_SETTING = 78;
    SECURITY_CENTER_BLOCKED = 79;
    TALK_PROXY_EXCEPTION = 80;
    E2EE_INVALID_PROTOCOL = 81;
    E2EE_RETRY_ENCRYPT = 82;
    E2EE_UPDATE_SENDER_KEY = 83;
    E2EE_UPDATE_RECEIVER_KEY = 84;
    E2EE_INVALID_ARGUMENT = 85;
    E2EE_INVALID_VERSION = 86;
    E2EE_SENDER_DISABLED = 87;
    E2EE_RECEIVER_DISABLED = 88;
    E2EE_SENDER_NOT_ALLOWED = 89;
    E2EE_RECEIVER_NOT_ALLOWED = 90;
    E2EE_RESEND_FAIL = 91;
    E2EE_RESEND_OK = 92;
    HITOKOTO_BACKUP_NO_AVAILABLE_DATA = 93;
    E2EE_UPDATE_PRIMARY_DEVICE = 94;
    SUCCESS = 95;
    CANCEL = 96;
    E2EE_PRIMARY_NOT_SUPPORT = 97;
    E2EE_RETRY_PLAIN = 98;
    E2EE_RECREATE_GROUP_KEY = 99;
    E2EE_GROUP_TOO_MANY_MEMBERS = 100;
    SERVER_BUSY = 101;
    NOT_ALLOWED_ADD_FOLLOW = 102;
    INCOMING_FRIEND_REQUEST_LIMIT = 103;
    OUTGOING_FRIEND_REQUEST_LIMIT = 104;
    OUTGOING_FRIEND_REQUEST_QUOTA = 105;
    DUPLICATED = 106;
    BANNED = 107;
    NOT_AN_INVITEE = 108;
    NOT_AN_OUTSIDER = 109;
    EMPTY_GROUP = 111;
    EXCEED_FOLLOW_LIMIT = 112;
    UNSUPPORTED_ACCOUNT_TYPE = 113;
}

exception TalkException {
    1: TalkErrorCode code;
    2: string reason;
    3: map<string, string> parameterMap;
}

enum MediaType {
    AUDIO = 1;
    VIDEO = 2;
    LIVE = 3;
}

enum Protocol {
    STANDARD = 1;
    CONSTELLA = 2;
}

enum CallFlowType {
    NEW = 1;
    PLANET = 2;
}

enum CallType {
    AUDIO = 1;
    VIDEO = 2;
    FACEPLAY = 3;
}

struct CallHost {
    1: string host;
    2: i32 port;
    3: string zone;
}

struct GroupCallRoute {
    1: string token;
    2: CallHost cscf;
    3: CallHost mix;
    4: string hostMid;
    5: list<string> capabilities;
    6: Protocol proto;
    7: string voipAddress;
    8: i32 voipUdpPort;
    9: i32 voipTcpPort;
    10: string fromZone;
    11: string commParam;
    12: string polarisAddress;
    13: i32 polarisUdpPort;
    14: string polarisZone;
    15: string orionAddress;
}

struct CallRoute {
    1: string fromToken;
    2: CallFlowType callFlowType;
    3: string voipAddress;
    4: i32 voipUdpPort;
    5: i32 voipTcpPort;
    6: string fromZone;
    7: string toZone;
    8: bool fakeCall;
    9: string ringbackTone;
    10: string toMid;
    11: string tunneling;
    12: string commParam;
}

struct TestCallRoute {
    1: string token;
    2: CallHost voipServer;
}

struct GroupCall {
    1: bool online;
    2: string chatMid;
    3: string hostMid;
    4: list<string> memberMids;
    5: i64 started;
    6: MediaType mediaType
    7: Protocol protocol;
}

service CallService {
    GroupCallRoute acquireGroupCallRoute (
        2: string chatMid;
        3: MediaType mediaType;
        4: bool isInitialHost;
        5: list<string> capabilities;
    ) throws(1: TalkException e);

    CallRoute acquireCallRoute (
        1: string to;
        2: CallType callType;
        3: map<string, string> fromEnvINfo;
    ) throws(1: TalkException e);

    TestCallRoute acquireTestCallRoute (
    ) throws(1: TalkException e);
    
    GroupCall getGroupCall(
        2: string chatMid;
    ) throws(1: TalkException e);
}