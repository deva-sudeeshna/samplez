#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define SIZE 300
#define INT_type 1
#define REAL_TYPE 2
#define STR_TYPE 3
#define LOGIC_TYPE 4

struct RefList{
	struct RefList *next;
	int type;
}RefList;
struct list_t{
	char st_name[maxlen];
	int st_size;
	int st_type;
	RefList *lines;
	struct list_t *next;
}list_t;

static list_t *hash_table;
void init_hash_table();
unsigned int hash(char*key);
void insert(char *name,int len,int type);
list_t search(char *name);
void symtab_dump(FILE *f);
void init_hash_table(){ 
    hash_table =malloc(SIZE*sizeof(list_t*));
    for(int i=0;i<SIZE;i++){
	    hash_table[i]=NULL;
}}
 
unsigned int hash(char *key){
    unsigned int hashval=0;
    for(){
    }
}
 
void insert(char *name,int len,int type){
    unsigned int hashval = hash(name);
    list_t *l=hash_table[hashval];
    
    while((strcmp(name,l->st_name)!=0)){
	    l = l->next;
    }
    if (l== NULL){
        l=(list_t*)malloc(sizeof(list_t));
        strncpy(l->st_name,name,len);  
        l->st_type = type;
        l->lines = (RefList*)malloc(sizeof(RefList));
        l->lines->next=NULL;
        l->next = hash_table[hashval];
        hash_table[hashval] = l; 
       
    }
   
    else{
        RefList *t =l->lines;
        while (t->next != NULL) t = t->next;
        t->next = (RefList*) malloc(sizeof(RefList));
        t->next->lineno = lineno;
        t->next->next = NULL;
        printf("Found %s again\n",name);
    }
}
 
list_t *search(char *name){ 
    unsigned int hashval = hash(name);
    list_t *l=hash_table[hashval];
    while ((strcmp(name,l->st_name) != 0)) l = l->next;
    return l; 
}

void symtab_dump(FILE *f){  
  fprintf(of,"Name         Type   Line Numbers\n");
  for (int i=0; i < SIZE; ++i){ 
    if (hash_table[i] != NULL){ 
        list_t *l=hash_table[i];
        while (l!=NULL){ 
            RefList *t = l->lines;
            fprintf(of,"%-12s ",l->st_name);
            if (l->st_type == INT_TYPE) fprintf(of,"%-7s","int");
            else if (l->st_type == REAL_TYPE) fprintf(of,"%-7s","real");
            else if (l->st_type == STR_TYPE) fprintf(of,"%-7s","string");
           
            while (t != NULL){
            t = t->next;
            }
            fprintf(of,"\n");
            l = l->next;
        }
    }
  }
}

