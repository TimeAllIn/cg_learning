//�������ݿ�
#include "data.h"
#include "screen_set.h"
//������λ��


int main()
{
	vector2 screen_size = vector2(700,700);
	
	make_screen(screen_size, EX_SHOWCONSOLE);

	vector2 mouse_posiiton = vector2();

	draw_solidrectangle(vector2(0,0),vector2(500,500),LIGHTBLUE);
	draw_solidrectangle(vector2(500, 0), vector2(700, 500), LIGHTGREEN);
	draw_solidrectangle(vector2(0, 500), screen_size);

	
	//����ѭ��
	
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
	
	return 0;
}