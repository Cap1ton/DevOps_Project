#include <fcgiapp.h>

int main() {
    FCGX_Init();
    FCGX_Request request;
    FCGX_InitRequest(&request, 0, 0);

    while(FCGX_Accept_r(&request) >= 0) {
        FCGX_PutS("Content-Type: text/html\n\n", request.out);
        FCGX_PutS("Hello World!", request.out);
        FCGX_Finish_r(&request);
    }
    return 0;
}