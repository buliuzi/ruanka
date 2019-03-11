#include <cstdio>
#include <algorithm>
using namespace std;

struct Student
{
	int id;
	int grade[4];
} stu[2010];

int now;
int Rank[1000000][4] = {0};
char Course[4] = {'A', 'C', 'M', 'E'};
bool cmp(Student a, Student b)
{
	return (a.grade[now] > b.grade[now]);
}
int main()
{
	//freopen("in.dat", "r", stdin);
	//freopen("out.dat", "w", stdout);
	int n, m;
	scanf("%d%d", &n, &m);
	for (int i = 0; i < n; i++)
	{
		scanf("%d%d%d%d", &stu[i].id, &stu[i].grade[1], &stu[i].grade[2], &stu[i].grade[3]);
		stu[i].grade[0] = (stu[i].grade[1] + stu[i].grade[2] + stu[i].grade[3]) / 3;
	}
	for (now = 0; now < 4; now++)
	{
		sort(stu, stu + n, cmp);
		Rank[stu[0].id][now] = 1;
		for (int i = 1; i < n; i++)
		{
			if (stu[i].grade[now] == stu[i - 1].grade[now])
			{
				Rank[stu[i].id][now] = Rank[stu[i - 1].id][now];
			}
			else
			{
				Rank[stu[i].id][now] = i + 1;
			}
		}
	}
	int query_id;
	for (int i = 0; i < m; i++)
	{
		scanf("%d", &query_id);
		if (Rank[query_id][0] == 0)
		{
			printf("N/A\n");
		}
		else
		{
			int minnum = 0;
			for (int j = 1; j < 4; j++)
			{
				if (Rank[query_id][j] < Rank[query_id][minnum])
				{
					minnum = j;
				}
			}
			printf("%d %c\n", Rank[query_id][minnum], Course[minnum]);
		}
	}

	return 0;
}
