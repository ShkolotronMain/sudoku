TARGET=bin/main
SRC_DIR = src
OBJ_DIR = obj

CXX = clang++
CFLAGS = -g -O3 -Wall -Wextra

SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(SRCS:%$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# главная цель сборки
all: $(TARGET)

# создание исполняемого файла
$(TARGET) : $(OBJS)
	$(CXX) $(OBJS) -o $@ 
#                     $@ возвращает имя цели, в данном случае bin/main

# создание объектных файлов
$(OBJ_DIR)/%.o : $(SRC_DIR)%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CFLAGS) -c $< -o $@
#   Создаем директорию objs, если она не существует (проверка через @mkdir)
#   Затем компилируем объектные файлы ()
#                       $< - возвращает все вхождения куда-либо, в данном случае в obj

# Очистка
clean:
	rm -r $(OBJ_DIR)/*.o 

.PHONY: all clean
