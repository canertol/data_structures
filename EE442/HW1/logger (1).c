#include <dirent.h> 
#include <stdio.h> 
#include <unistd.h>
#include <string.h> 
#include <sys/types.h>
#include <sys/stat.h>

char str1[]= "2031466\n";
char str2[]= "/test.list";
char str3[]= "\n";
char path1[500];
char path2[500];

int file_stat(const char *path)
{
	struct stat path_stat;
	stat(path, &path_stat);
	return S_ISREG(path_stat.st_mode);
}

char open( char *path)
{int g=file_stat(path);
if (g==0);
	//opendir(path);
else return (*path);
open(path);

}

int main(){

FILE *fp;
DIR *d;
struct dirent *dir;

printf("Write the absolute pathway of the directory to be listed:\n");
scanf("%s", path1);
strcpy(path2,path1);
strcat(path1,str2);
fp = fopen(path1, "w+b");
fwrite(str1 , 1 , sizeof(str1) , fp );
fwrite(path2 , 1 , sizeof(path2) , fp );

 d = opendir(path2);
char cwd[5000];


if (d) {
    while ((dir = readdir(d)) != NULL) {
//getcwd(cwd, sizeof(cwd));
//printf("%s",cwd);	
//open(cwd);
file_stat(cwd);
        //printf("%s\n", dir->d_name);
	strcat(dir->d_name,str3);
	fwrite(dir->d_name , 1 , sizeof(dir->d_name) , fp );
    }
    closedir(d);
  }
 //   while (1) {
 //     if file_stat(*path)
//	opendir(".");
//	else
 
    
// if(readdir(d) != NULL)
//	break;
 //		}
//}
	return(0);
}



//char *getcwd(char *buf, size_t size);
//char cwd[1024];

//char *pw= getcwd(cwd, sizeof(cwd));
//char str2[]=cwd;
//   /home/canertol/Desktop/EE442/homework_1/example/test
