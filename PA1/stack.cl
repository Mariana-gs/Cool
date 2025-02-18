class Main inherits IO{

	primeiroelemento:String;
    segundoelemento:String;
	contadorpilha :Int;
	
	elementotemporario:String;
	executando:Bool;

	comandousuario:String;
    
	a2iobj:A2I;
	stat:Int;
    
	head:Element;
	temp:Element;
	last:Element;
	temp2:Element;
    tempstr:String;

	main():Object{{

		a2iobj <- new A2I;

		contadorpilha <- 0;
		executando <- true;

		out_string("Comandos disponíveis:\n1.<int> - Adicionar número à pilha\n");
		out_string("2.+ - Somar os dois últimos elementos da pilha\n");
		out_string("3.s - Trocar os dois últimos elementos da pilha\n");
		out_string("4.e - Executar operação baseada no topo da pilha\n");
		out_string("5.d - Mostrar pilha\n");
		out_string("6.x - Sair\n");


		while executando loop {

			out_string(">");
			comandousuario <- in_string();

            if comandousuario ="x" 
			then{

				out_string("\nTerminating ....\n");
				executando <- false;

			} 
			else 
				if comandousuario = "e" 
				then {

				elementotemporario <- popstack();
				
					if  elementotemporario = "+" 
					then
						
						if contadorpilha < 2 
						then {

							out_string("\nImproper Stack .Not enough integers\nAborting ...\n");
							abort();
					
						}
						else {      	
							primeiroelemento <- popstack();
							segundoelemento <- popstack();
							pushstack(a2iobj.i2a(a2iobj.a2i(primeiroelemento)+a2iobj.a2i(segundoelemento)));
						}
						fi

                	else 
						if  elementotemporario="s" 
						then {

							primeiroelemento<-popstack();
							segundoelemento<-popstack();
							pushstack(primeiroelemento);
							pushstack(segundoelemento);
						}
                	else
						pushstack( elementotemporario)   				
						fi
            		fi;}

            	else 
					if comandousuario = "d" 
					then printstack() 

					else pushstack(comandousuario)
			
					fi
				fi
			fi;
		} (*Fim Execução*)
		pool;	
			 	 		
	}}; (*Fim Main*)

    pushstack(st:String):Object{{
        contadorpilha <- contadorpilha+1;
		temp<-new Element;
        temp.init(st);
        if contadorpilha=1 then head<-temp else
        {temp.addthis(head);
            head<-temp;}
        fi;
    
    
    }};
    popstack():String{{
        contadorpilha<-contadorpilha-1;
        tempstr<-head.getelem();
        head<-head.getnext();
        tempstr;
    
    }};

    
	printstack():Object{{
		
		temp2<-head;
		out_string("The stack now is :\n");
		while not isvoid temp2 
						   loop 
						   {out_string(temp2.getelem());out_string("\n");
						   temp2<-temp2.getnext();
						   }
						   pool;
	
	}};


};

class Element inherits IO{

	h:String;
	t:Element;
	init(x:String):Object{
	h<-x
	};
	addthis(y:Element):Object{
	t<-y
	};
	getelem():String{h};
	getnext():Element{t};
};
