#include <stdio.h>
#include <string.h>
#include<stdlib.h>
#include<ctype.h>

int iskeyword(char buffer[])
{
   char keyword[32][10]={
      "auto","double","int","struct","break","else","long",
      "switch","case","enum","register","typedef","char",
      "extern","return","union","const","float","short",
      "unsigned","continue","for","signed","void","default",
      "goto","sizeof","voltile","do","if","static","while"
   } ;
int i;
   for(i = 0; i < 32; i++) {
      if(strcmp(keyword[i],buffer)==0) {
        return 1;
      }
   }
   return 0;
}
int main()
{
  char ch,buffer[15],operator[]="+ - / % = *";
FILE *fp;
int i,j=0;
fp=fopen("lex.c","r");
if(fp==NULL)
{
printf("error while opening the file");
exit(0);
}
while((ch=fgetc(fp))!=EOF)
{
for(i=0;i<6;++i)
{
if(ch!=operator[i])
break;
else
printf("%c is operator\n",ch);
}
if(isalnum(ch))
{
buffer[j++]=ch;
}
else if((ch==' '||ch=='\n')&&(j!=0))
{
buffer[j]='\0';
j=0;
if(iskeyword(buffer)==1)
printf("%s is keyword\n",buffer);
else
printf("%s is identifier\n",buffer);
}
}
fclose(fp);
return 0;
}
