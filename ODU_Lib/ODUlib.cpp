#include "pch.h"
#include "stdafx.h"
#include <iostream>
#include <conio.h>
#include <string>
#include <strstream>
#include <ctime>

extern "C"
{

	int __stdcall power(int a, int b)
	{
		return pow(a, b);
	}

	int __stdcall random(int a)
	{
		a = abs(a);

		if (a == 0)
			return 0;

		srand(time(NULL));

		int k = rand() % a;

		return k;
	}

	int __stdcall strLen(char* str)
	{
		int len = 0;

		for (int i = 0; str[i] != '\0'; i++)
			len++;

		return len;
	}

	char* __stdcall concat(char* str0, char* str1) {
		std::strstream stream;

		stream << str0 << str1 << '\0';

		return stream.str();
	}

	char* __stdcall inttostr(int a) {
		std::strstream stream;

		stream << a << '\0';

		return stream.str();
	}

	char* __stdcall copy(char* a) {
		std::strstream stream;

		stream << a << '\0';

		return stream.str();
	}		

	int __stdcall inputInt() {
		int result;

		std::cin >> result;

		return result;
	}
	char* __stdcall inputString() {
		char* buf = (char*)calloc(1024, 1);
		char* str;
		int len;

		std::cin >> buf;

		len = strlen(buf);

		str = (char*)calloc(len + 1, 1);

		for (short i = 0; i < len; i++)
			str[i] = buf[i];
		
		str[len] = '\0';

		return str;
	}
	char* __stdcall inputChar() {
		char symbol = _getch();
		char* result = (char*)calloc(2, 1);

		std::cout << symbol << std::endl;

		result[0] = symbol;
		result[1] = '\0';

		return result;
	}

	int __stdcall outnum(int value)
	{
		std::cout << value;

		return 0;
	}
	int __stdcall outstr(char* ptr)
	{
		if (ptr == nullptr)
			std::cout << std::endl;

		for (int i = 0; ptr[i] != '\0'; i++)
			std::cout << ptr[i];

		return 0;
	}

	int __stdcall outnumline(int value)
	{
		std::cout << value << std::endl;

		return 0;
	}
	int __stdcall outstrline(char* ptr)
	{
		if (ptr == nullptr)
			std::cout << std::endl;

		for (int i = 0; ptr[i] != '\0'; i++)
			std::cout << ptr[i];

		std::cout << std::endl;

		return 0;
	}

	int __stdcall system_pause()
	{
		system("pause");
		return 0;
	}
}