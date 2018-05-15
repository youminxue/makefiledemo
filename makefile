#版本4
cc = g++
bin = bin
dest = test
objsdir=objs
includedir=src
CFLAGS=-Wall -W -g 
INCLUDE=-I$(includedir)
deps = $(shell find ./ -name "*.h")
src = $(notdir $(wildcard $(includedir)/*.cc))
objs = $(patsubst %.cc, $(objsdir)/%.o, $(src))

.PHINY: all clean
all: $(objsdir)/$(objs)
	@echo $(objsdir)/$(objs)
	@echo $(includedir)
	$(cc) -o $(bin)/$(dest) $(objs)

$(objsdir)/%.o: $(includedir)/%.cc
	$(cc) -c $< -o $@ $(CFLAGS) $(INCLUDE)

clean:
	rm -rf $(objs) $(bin)/$(dest)

#版本3，简化代码
# cc = g++
# dest = test
# objs = student.o people.o main.o

# $(dest):$(objs)
# 	$(cc) -o $(dest) $(objs)

# %.o: %.c 
# 	$(cc) -c $< -o $@#$<表示依赖关系表第一项 $^表示依赖整个关系表 $@表示当前的目标

# clean:
# 	rm -rf $(objs) $(dest)
#版本2
#分别编译解决一个改变全部重新编译的问题
# cc = g++
# dest = test
# objs = student.o people.o main.o

# $(dest):$(objs)
# 	$(cc) -o $(dest) $(objs)

# student.o: student.cc
# 	$(cc) -c student.cc

# people.o: people.cc
# 	$(cc) -c people.cc

# main.o: main.cc
# 	$(cc) -c main.cc
#版本1
#使用参数模板解决
# cc = g++
# source = main.cc people.cc student.cc
# dest = test

# $(dest):$(source)
# 	$(cc) -o $(dest) $(source)
#版本0
#上面是用变量代替参数实现模板化
# cale: main.cc people.cc
# 	g++ -o cale main.cc people.cc student.cc