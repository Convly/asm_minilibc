##
## Makefile for asm in /home/julien/Documents/rendu/ASM/asm_minilibc
##
## Made by Julien Aguilar
## Login   julien.aguilar@epitech.eu
##
## Started on  Wed Mar  8 10:20:19 2017 Julien Aguilar
## Last update Thu Mar 23 19:58:00 2017 Aguilar Julien
##

LD				=		ld

ASM				=		nasm

RM				=		rm -f

ASMFLAGS	=		-f elf64

SRCS			=		srcs/strlen.asm \
					srcs/strchr.asm \
					srcs/rindex.asm \
					srcs/memset.asm \
					srcs/strcmp.asm \
					srcs/strcasecmp.asm \
					srcs/memcpy.asm \
					srcs/strpbrk.asm \
					srcs/strncmp.asm \
					srcs/strstr.asm \
					srcs/strcspn.asm \
					srcs/memmove.asm \

OBJS			=		$(SRCS:.asm=.o)

NAME			=		libasm.so

all:	$(NAME)

$(NAME):	$(OBJS)
					$(LD) -o $(NAME) -shared $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

%.o : %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<
