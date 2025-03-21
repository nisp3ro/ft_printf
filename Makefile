############################################################################################################
# Variables

NAME		=		libftprintf.a
BNAME		=		libftprintf_bonus.a

INCLUDE		=		./include/ft_printf.h

SRC_DIR		=		./src/
SRCS		=		$(addprefix $(SRC_DIR), \
					ft_printf.c ft_printf_chars.c ft_printf_nb.c ft_printf_unb.c ft_printf_hex.c \
					ft_printf_ptr.c ft_printf_utils.c ft_putnbr_base.c )

# Objects
OBJ_DIR		=		./obj
OBJ			=		$(SRCS:$(SRC_DIR)%.c=$(OBJ_DIR)/%.o)
OBJ_B_DIR	=		./obj_bonus
OBJS_BONUS	=		$(SRCS:$(SRC_DIR)%.c=$(OBJ_B_DIR)/%.o)

# Compiler
LIB 		=		ar rcs
RM			=		rm -rf
CFLAGS		=		-Wall -Wextra -Werror
CC			=		cc

# Colors
GREEN		=		\033[0;32m
UGREEN		=		\033[4;32m
RED			=		\033[0;31m
YELLOW		=		\033[0;33m
LILA		=		\033[0;35m
NC			=		\033[0m # No color

############################################################################################################
# Rules

all: ascii_art

bonus: ascii_art_bonus

ascii_art:
	@if ! $(MAKE) -q $(NAME); then \
		printf "$(LILA)\n"; \
		printf "███████╗████████╗     ██████╗ ██████╗ ██╗███╗   ██╗████████╗███████╗\n"; \
		printf "██╔════╝╚══██╔══╝     ██╔══██╗██╔══██╗██║████╗  ██║╚══██╔══╝██╔════╝\n"; \
		printf "█████╗     ██║        ██████╔╝██████╔╝██║██╔██╗ ██║   ██║   █████╗  \n"; \
		printf "██╔══╝     ██║        ██╔═══╝ ██╔══██╗██║██║╚██╗██║   ██║   ██╔══╝  \n"; \
		printf "██║        ██║███████╗██║     ██║  ██║██║██║ ╚████║   ██║   ██║     \n"; \
		printf "╚═╝        ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝\n"; \
		printf "		     					   MRUBAL-C\033[0m\n"; \
		echo "$(YELLOW)\nCreating program...$(GREEN)"; \
		$(MAKE) -s $(NAME); \
	else \
		echo "$(GREEN)[$(NAME)] is already up to date.$(NC)"; \
	fi

ascii_art_bonus:
	@if ! $(MAKE) -q $(BNAME); then \
		printf "$(LILA)\n"; \
		printf "$(LILA)\n"; \
		printf "███████╗████████╗     ██████╗ ██████╗ ██╗███╗   ██╗████████╗███████╗\n"; \
		printf "██╔════╝╚══██╔══╝     ██╔══██╗██╔══██╗██║████╗  ██║╚══██╔══╝██╔════╝\n"; \
		printf "█████╗     ██║        ██████╔╝██████╔╝██║██╔██╗ ██║   ██║   █████╗  \n"; \
		printf "██╔══╝     ██║        ██╔═══╝ ██╔══██╗██║██║╚██╗██║   ██║   ██╔══╝  \n"; \
		printf "██║        ██║███████╗██║     ██║  ██║██║██║ ╚████║   ██║   ██║     \n"; \
		printf "╚═╝        ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝\n"; \
		printf "		     					   MRUBAL-C\033[0m\n"; \
		echo "$(YELLOW)\nCreating bonus program...$(GREEN)"; \
		$(MAKE) -s $(BNAME); \
	else \
		echo "$(GREEN)[$(BNAME)] is already up to date.$(NC)"; \
	fi

$(NAME): $(OBJ) $(INCLUDE)
	@$(LIB) $(NAME) $(OBJ) && \
	(printf "$(UGREEN)\n%s$(NC)" "[$(NAME)]"; printf "$(GREEN)%s$(NC)\n" "Compiled successfully.")

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	@echo -n "█"
	@$(CC) $(CFLAGS) -c -o $@ $<

$(BNAME): $(OBJS_BONUS) $(INCLUDE)
	@$(LIB) $(BNAME) $(OBJS_BONUS) && \
	(printf "$(UGREEN)\n%s$(NC)" "[$(BNAME)]"; printf "$(GREEN)%s$(NC)\n" "Compiled successfully.")

$(OBJ_B_DIR)/%.o : $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_B_DIR)
	@echo -n "█"
	@$(CC) -D BONUS=1 $(CFLAGS) -c -o $@ $<

clean:
	@$(RM) $(OBJ_DIR)
	@$(RM) $(OBJ_B_DIR)
	@printf "$(RED)%s$(NC)\n" "[$(NAME)] Object files cleaned."

fclean: clean
	@$(RM) $(NAME)
	@$(RM) $(BNAME)
	@printf "$(RED)%s$(NC)\n" "[$(NAME)] Cleaned successfully."

re: fclean all
rebonus: fclean bonus

.PHONY: all bonus clean fclean re rebonus

############################################################################################################
