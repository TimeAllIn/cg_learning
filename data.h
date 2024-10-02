#pragma once
#include <iostream>
#include <cmath>


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


struct creature
{
    bool is_live = true;
    vector2 position = vector2();

};

struct array_creature
{
    int size = 0;
    creature* temp_creature = new creature[0];
    //���Ԫ��
    void append(creature add_creature)
    {
        if (size == 0)
        {
            size += 1;
            temp_creature = new creature[size];
            temp_creature[size - 1] = add_creature;
        }
        else
        {
            array_creature temp = copy_array();
            size += 1;
            temp_creature = new creature[size];
            temp_creature[size - 1] = add_creature;
            for (int i = 0; i < temp.size; i++)
            {
                temp_creature[i] = temp.temp_creature[i];
            }
            delete &temp;
        }    
    }
    //Ѱ��ɾ��
    void clear_null()
    {
        int live_num = 0;
        array_creature temp = copy_array();
        for (int i = 0; i < size; i++)
        {           
            if (!temp_creature[i].is_live)
            {
                live_num += 1;
            }
        }
        size -= live_num;
        temp_creature = new creature[size];

        int look_num = 0;

        for (int i = 0; i < size; i++)
        {
            for (int ti = look_num; ti < temp.size; ti++)
            {
                if (temp.temp_creature[ti].is_live)
                {
                    look_num = ti + 1;
                    temp_creature[i] = temp.temp_creature[ti];
                    break;
                }
            }
        }

    }
    array_creature copy_array()
    {
        array_creature new_array;
        new_array.size = size;
        new_array.temp_creature = temp_creature;
        return new_array;
    }
};