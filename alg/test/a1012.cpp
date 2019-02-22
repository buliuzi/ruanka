#include <cstdio>
using namespace std;

struct Student
{
	char id[8];
	int c, m, e, a;
}stu[2010];

int main()
{
	freopen("in.dat", "r", stdin);
	int n, m;
	scanf("%d%d", &n, &m);
	for (int i = 0; i < n; i++) {
		scanf("%s%d%d%d", stu[i].id, &stu[i].c, &stu[i].m, &stu[i].e);
	}
}


