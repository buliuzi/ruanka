#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;

const int SAGES = 4;
const int NOBLEMEN = 3;
const int FOOLMEN = 2;
const int PASS = 1;
const int NONE = 0;
int N, L, H, num = 0;

struct Student
{
	char ID[10];
	int vg;
	int tg;
	//增加结构//
	int sum;//
	int flag;//
	///////////
}stu[100010];
/*
这里的想法是没错的，要进行classify， 
但是没有考虑到最好的ifelse结构，
而且classify多次调用，num重复增加这一点造成了错误
*/
/*/////////////////////////////////////////
int classify(Student a)
{
	if (a.vg >= H && a.tg >= H) {
		return SAGES;
	}
	else if (a.vg >= H && a.tg >= L) {
		return NOBLEMEN;
	}
	else if (a.vg < H&&a.vg >= L && a.tg < H&&a.tg >= L && a.vg>=a.tg) {
		return FOOLMEN;
	}
	else if(a.vg >= L && a.tg >= L) {
		return PASS;
	}
	else {
		num++;
		return NONE;
	}
}
///////////////////////////////////////////*/
bool cmp(Student a, Student b)
{
	if (a.flag != b.flag) {
		return a.flag > b.flag;
	}
	else if (a.sum != b.sum) {
		return a.sum > b.sum;
	}
	else if (a.vg != b.vg) {
		return a.vg > b.vg;
	}
	else {
		return (strcmp(a.ID, b.ID) < 0);
	}
}

int main()
{
	freopen("in.dat", "r", stdin);
	
	scanf("%d%d%d", &N, &L, &H);
	for (int i = 0; i < N; i++)
	{
		scanf("%s %d %d", stu[i].ID, &stu[i].vg, &stu[i].tg);
		stu[i].sum = stu[i].vg + stu[i].tg;
		if (stu[i].vg < L||stu[i].tg < L) {
			//不及格
			num++;
			stu[i].flag = NONE;
		}
		else if (stu[i].vg >= H && stu[i].tg >= H) {
			stu[i].flag = SAGES;
		}
		else if (stu[i].vg >= H && stu[i].tg < H) {
			stu[i].flag = NOBLEMEN;
		}
		else if (stu[i].vg >= stu[i].tg) {
			stu[i].flag = FOOLMEN;
		}
		else {
			stu[i].flag = PASS;
		}
	}
	sort(stu, stu + N, cmp);
	printf("%d\n", N - num);
	for (int i = 0; i < N - num; i++) {
		printf("%s %d %d\n", stu[i].ID, stu[i].vg, stu[i].tg);
	}
	return 0;
}