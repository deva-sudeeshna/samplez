symtab.c:

init_hashtable()-
This function is to initialize hashtable. It's size is predefined. As hashtable is dynamic malloc function is used to allocate memory to pointers which are initialized to zero initially.

insert()-
This function is to insert new tokens into symbol table. The name of token, its length and attribute of the token are the parameters of each entry into the table. 
If the entry is already present in the symbol table, it need not be inserted again as both the entries will have same information. If the entry has not been inserted presentthen we should create new entry that will contain all parameters and initialize reference list.

symtab_dump()-
This function is used to print contents symbol table. Wherever the cooresponding patterns are found as written in lex file, they will be written to symbol table with name and type. 


hash()-
This is the main hash function.I couldn't complete it.