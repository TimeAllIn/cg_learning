#pragma once
#include <iostream>
#include <cmath>
//导入图形库
#include <easyx.h>

typedef struct vector2
{
	float x = 0, y = 0;
	//初始化设置
	vector2(float tx = 0, float ty = 0) : x(tx), y(ty) {}
	//运算符重载
    // 加法运算符重载  
    vector2 operator+(const vector2& other) const {
        return vector2(x + other.x, y + other.y);
    }
    // 减法运算符重载  
    vector2 operator-(const vector2& other) const {
        return vector2(x - other.x, y - other.y);
    }
    // 标量乘法运算符重载  
    vector2 operator*(float scalar) const {
        return vector2(x * scalar, y * scalar);
    }
    // 向量乘法运算符重载（点积）  
    float operator*(const vector2& other) const {
        return x * other.x + y * other.y;
    }
    // 输出运算符重载  
    friend std::ostream& operator<<(std::ostream& os, const vector2& vec) {
        os << "(" << vec.x << ", " << vec.y << ")";
        return os;
    }
    //向量长度计算
    float distance()
    {
        return sqrtf(x * x + y * y);
    }
    //点点间距离
    float to_distance(vector2 target)
    {
        return sqrtf((x - target.x) * (x - target.x) + (y - target.y) * (y - target.y));
    }
    //向量标准化
    void normalized()
    {
        float temp_distance = distance();
        x = x / temp_distance;
        y = y / temp_distance;
    }
};