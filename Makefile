# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrubal-c <mrubal-c@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/01 10:13:06 by mrubal-c          #+#    #+#              #
#    Updated: 2024/10/01 14:11:22 by mrubal-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libftprintf.a
SRC_DIR =	./src
OBJ_DIR	=	./ofiles
SRC	=	  $(SRC_DIR)/ft_printf.c\
		  $(SRC_DIR)/ft_printf_char_n_strings.c\
		  $(SRC_DIR)/ft_printf_hexa_n_pointers.c\
		  $(SRC_DIR)/ft_printf_numbers.c\

OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
CFLAGS	= -Wall -Wextra -Werror -I$(SRC_DIR)
INCLUDE = ./include/ft_printf.h
LIB = ar rcs
RM = rm -f

# Colores
GREEN = \033[0;32m
RED = \033[0;31m
YELLOW = \033[0;33m
NC = \033[0m # No color

all : $(NAME)

$(NAME): $(OBJ)
	@echo "$(YELLOW)Creating library...$(NC)"
	$(LIB) $(NAME) $(OBJ)
	@echo "$(GREEN)Library created 👍: $(NAME)$(NC)"

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	@echo "$(YELLOW)Compiling ⚙️ $<...$(NC)"
	@cc -c $(CFLAGS) $< -o $@

fclean :
	@echo "$(RED)Removing library and object files... 🧹$(NC)"
	$(RM) $(NAME)
	$(RM) -r $(OBJ_DIR)
	@echo "$(GREEN)Clean complete 🗑️$(NC)"

clean :
	@echo "$(RED)Removing object files... 🧹$(NC)"
	$(RM) -r $(OBJ_DIR)
	@echo "$(GREEN)Clean complete 🗑️$(NC)"

re : fclean all

.PHONY: all clean fclean re

