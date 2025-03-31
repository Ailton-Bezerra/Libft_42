# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ailbezer <ailbezer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/05 11:08:49 by ailbezer          #+#    #+#              #
#    Updated: 2025/03/31 13:31:50 by ailbezer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
HEADERS := libft.h
SRC_B_DIR := list/
SRC_BONUS := $(addprefix $(SRC_B_DIR), ft_lstnew_bonus.c ft_lstadd_front_bonus.c \
			ft_lstadd_back_bonus.c ft_lstsize_bonus.c \
			ft_lstlast_bonus.c ft_lstdelone_bonus.c \
			ft_lstclear_bonus.c ft_lstiter_bonus.c \
			ft_lstmap_bonus.c)
SRCS_DIR := ./
SRCS     := $(addprefix $(SRCS_DIR), check/ft_isalpha.c check/ft_isdigit.c \
		check/ft_isalnum.c check/ft_isascii.c check/ft_isprint.c\
		memory/ft_memset.c memory/ft_bzero.c memory/ft_memcpy.c \
		memory/ft_memmove.c memory/ft_memcmp.c memory/ft_calloc.c \
		memory/ft_memchr.c \
		print/ft_putchar_fd.c print/ft_putstr_fd.c print/ft_putendl_fd.c \
		print/ft_putnbr_fd.c\
		convert/ft_toupper.c convert/ft_tolower.c convert/ft_atoi.c \
		convert/ft_itoa.c convert/ft_split.c \
		str/ft_strlen.c str/ft_strlcpy.c str/ft_strlcat.c \
		str/ft_strchr.c str/ft_strrchr.c str/ft_strncmp.c \
		str/ft_strnstr.c str/ft_strdup.c str/ft_substr.c  \
		str/ft_strjoin.c str/ft_strtrim.c  \
		str/ft_strmapi.c str/ft_striteri.c)
DIR_OBJ		:= .objs
OBJ		:= $(SRCS:$(SRCS_DIR)%.c=$(DIR_OBJ)/%.o)
OBJ_BONUS := $(SRC_BONUS:%.c=$(DIR_OBJ)/%.o)
CC = cc
FLAGS = -Wall -Wextra -Werror -I.

all: ${NAME}

$(DIR_OBJ)/%.o: $(SRCS_DIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC) $(FLAGS) -c $< -o $@

${NAME}: ${OBJ}
	@ar rc ${NAME} ${OBJ}

bonus: ${OBJ_BONUS}
	@ar rc ${NAME} ${OBJ_BONUS}

clean:
	@rm -rf $(DIR_OBJ) $(DIR_OBJ_BONUS)

fclean: clean
	@rm -f ${NAME}

re: fclean all

.PHONY: all bonus clean fclean re