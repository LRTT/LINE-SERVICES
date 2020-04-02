enum Features {
    GEOLOCATION = 1;
    ADVERTISING_ID = 2;
    BLUETOOTH_LE = 3;
    QR_CODE = 4;
    ADVERTISING_SDK = 5;
    ADD_TO_HOME = 6;
    SHARE_TARGET_MESSAGE = 7;
    VIDEO_AUTO_PLAY = 8;
    PROFILE_PLUS = 9;
}

enum MenuStyle {
    LIGHT = 1;
    LIGHT_TRANSLUCENT = 2;
    DARK_TRANSLUCENT = 3;
}

enum LiffErrorCode {
    INVALID_REQUEST = 1;
    UNAUTHORIZED = 2;
    CONSENT_REQUIRED = 3;
    VERSION_UPDATE_REQUIRED = 4;
    SERVER_ERROR = 100;
}

struct LiffErrorPayload {
    3: bool consentRequired;
}

exception LiffException {
    1: LiffErrorCode code;
    2: string message;
    3: LiffErrorPayload payload;
}

struct LiffChatContext {
    1: string chatMid;
}

struct SquareChatContext {
    1: string squareChatMid;
}

struct LiffContext {
    1: bool none;
    2: LiffChatContext chat;
    3: SquareChatContext squareChat;
}

struct LiffAdvertisingId {
    1: string advertisingId;
    2: bool tracking;
}

struct LiffDeviceSetting {
    1: bool videoAutoPlayAllowed;
    2: LiffAdvertisingId advertisingId;
}

struct LiffViewRequest {
    1: string liffId;
    3: string lang;
    2: LiffContext context;
    4: LiffDeviceSetting deviceSetting;
}

struct LiffView {
    1: string type;
    2: string url;
    11: bool trustedDomain;
    6: string titleIconUrl;
    4: i32 titleTextColor;
    7: i32 titleSubtextColor;
    8: i32 titleButtonColor;
    5: i32 titleBackgroundColor;
    9: i32 progressBarColor;
    10: i32 progressBackgroundColor;
    12: bool suspendable;
    16: bool suspendableV2;
    13: bool maxBrightness;
    14: string titleButtonAreaBackgroundColor;
    15: string titleButtonAreaBorderColor;
    17: MenuStyle menuStyle;
    18: bool moduleMode;
}

struct LiffViewResponse {
    1: LiffView view;
    2: string contextToken;
    3: string accessToken;
    4: string featureToken;
    5: list<Features> features;
    6: string channelId;
    7: string idToken;
    8: list<string> scopes;
}

struct RevokeTokenRequest {
    1: string accessToken;
}

service LiffService {
    LiffViewResponse issueLiffView(
        1: LiffViewRequest request;
    ) throws(1: LiffException e);
    
    void revokeToken(
        1: RevokeTokenRequest request;
    ) throws(1: LiffException e);
}