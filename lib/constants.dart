const bool Debug = false;
const String FrontendURL =
    Debug ? "http://192.168.31.10:8080" : "http://baize.dev.builds.ninja";
const String BackendURL = Debug
    ? "http://192.168.31.10:7070/api/v1"
    : "http://baize.dev.builds.ninja:7070/api/v1";
const String LoginURL = BackendURL + "/sso/login";
