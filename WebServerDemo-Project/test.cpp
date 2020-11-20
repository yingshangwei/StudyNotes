/**
 * client.c
 *
 * TCP client program, it is a simple example only.
 * Writen By: Zhou Jianchun
 * Date: 2011.08.11
 *
 * Compiled With: gcc -o client client.c
 * Tested On: Ubuntu 11.04 LTS
 * gcc version: 4.5.2
 *
 */
 
#include <stdio.h>
#include <sys/socket.h>
#include <unistd.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
 
#define SERVER_PORT 1883
 
void usage(char *name)
{
	printf("usage: %s IP\n", name);
}
int main(int argc, char **argv)
{
	int server_fd, client_fd, length = 0;
	struct sockaddr_in server_addr, client_addr;
	socklen_t socklen = sizeof(server_addr);
 
	if(argc < 2)
	{
		usage(argv[0]);
		exit(1);
	}
	if((client_fd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
	{
		printf("create socket error, exit!\n");
		exit(1);
	}
	srand(time(NULL));
	bzero(&client_addr, sizeof(client_addr));
	client_addr.sin_family = AF_INET;
	client_addr.sin_addr.s_addr = htons(INADDR_ANY);
 
	bzero(&server_addr, sizeof(server_addr));
	server_addr.sin_family = AF_INET;
	inet_aton(argv[1], &server_addr.sin_addr);
	server_addr.sin_port = htons(SERVER_PORT);
 
	if(connect(client_fd, (struct sockaddr*)&server_addr, socklen) < 0)
	{
		printf("can not connect to %s, exit!\n", argv[1]);
		printf("%s\n", strerror(errno));
		exit(1);
	}
	return 0;
}
