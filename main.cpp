//导入数据库
#include "data.h"
#include "screen_set.h"
//主函数位置


int main()
{
	vector2 screen_size = vector2(700,700);
	
	make_screen(screen_size, EX_SHOWCONSOLE);

	vector2 mouse_posiiton = vector2();

	draw_solidrectangle(vector2(0,0),vector2(700,500),LIGHTBLUE);
	draw_solidrectangle(vector2(0, 500), screen_size);

	creature tt;
	array_creature a;
	tt.position = vector2(200, 200);
	
	a.append(tt);
	

	tt.position = vector2(1200, 200);

	a.append(tt);
	a.append(tt);
	std::cout << a.temp_creature[2].position<<std::endl;
	//程序循环
	/*
	while (true)
	{
		ExMessage mes;
		while (peekmessage(&mes))
		{
			if (mes.message == WM_MOUSEMOVE)
			{
				mouse_posiiton.x = mes.x;
				mouse_posiiton.y = mes.y;
			}
			else if (mes.message == WM_RBUTTONUP)
			{
				circle(mouse_posiiton.x, mouse_posiiton.y, 50);
				//draw_solidrectangle(mouse_posiiton, mouse_posiiton + vector2(50, 50));
			}
		}
	}
	*/
	return 0;
}