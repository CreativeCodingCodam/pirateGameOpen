NAME	:= learngl
CC		:= g++
FLAGS	:= -Wall -Wextra -Werror -pedantic -I./include -Iglfw-3.4/include -I/usr/local/include -Lglfw-3.4/build/src -L/usr/local/lib -std=c++17
LIBS	:= -lglfw3 -lrt -lm -lGL -lX11 -lpthread -lXrandr -lXi -ldl

OBJ_DIR	:= obj
SRC_DIR	:= src

#keep main at the end
FILES	:=	stb_image glad main

SRCS	:= $(addprefix ${SRC_DIR}/,$(FILES:=.cpp))

OBJS	:= $(addprefix $(OBJ_DIR)/,$(FILES:=.o))


all: $(NAME)

debug: FLAGS += -DDEBUG_MACRO -g
debug: fclean $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS)
	$(CC) $(OBJS) $(FLAGS) -o $(NAME) $(LIBS)


$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
