#pragma once
#include <iostream>
#include <cmath>
//����ͼ�ο�
#include <easyx.h>

typedef struct vector2
{
	float x = 0, y = 0;
	//��ʼ������
	vector2(float tx = 0, float ty = 0) : x(tx), y(ty) {}
	//���������
    // �ӷ����������  
    vector2 operator+(const vector2& other) const {
        return vector2(x + other.x, y + other.y);
    }
    // �������������  
    vector2 operator-(const vector2& other) const {
        return vector2(x - other.x, y - other.y);
    }
    // �����˷����������  
    vector2 operator*(float scalar) const {
        return vector2(x * scalar, y * scalar);
    }
    // �����˷���������أ������  
    float operator*(const vector2& other) const {
        return x * other.x + y * other.y;
    }
    // ������������  
    friend std::ostream& operator<<(std::ostream& os, const vector2& vec) {
        os << "(" << vec.x << ", " << vec.y << ")";
        return os;
    }
    //�������ȼ���
    float distance()
    {
        return sqrtf(x * x + y * y);
    }
    //�������
    float to_distance(vector2 target)
    {
        return sqrtf((x - target.x) * (x - target.x) + (y - target.y) * (y - target.y));
    }
    //������׼��
    void normalized()
    {
        float temp_distance = distance();
        x = x / temp_distance;
        y = y / temp_distance;
    }
};