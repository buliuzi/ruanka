#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;

struct STUDENT
{
    int usrid;
    int totalscore = {0};
    int score[6] = {-2, -2, -2, -2, -2, -2};
    int flag = {0};
    int rank;
    int good = {0}; //注意这道题目需要确定有全0分输出的情况，需要和全0分区分
} stu[10010];

bool cmp(STUDENT a, STUDENT b)
{
    if (a.totalscore != b.totalscore)
    {
        return a.totalscore > b.totalscore;
    }
    else if (a.flag != b.flag)
    {
        return a.flag > b.flag;
    }
    else
    {
        return a.usrid < b.usrid;
    }
}
int main()
{
    //freopen("in.dat", "r", stdin);
    //freopen("out.dat", "w", stdout);
    int n, k, m;
    int fullmark[6];
    scanf("%d%d%d", &n, &k, &m);
    for (int i = 1; i <= k; i++)
    {
        scanf("%d", &fullmark[i]);
    }
    int uid, pid, score;
    for (int i = 0; i < m; i++)
    {
        scanf("%d%d%d", &uid, &pid, &score);
        if (score == -1)
        {
            score = 0;
        }
        else
        {
            stu[uid].good = 1;
        }
        stu[uid].usrid = uid;
        stu[uid].score[pid] = score > stu[uid].score[pid] ? score : stu[uid].score[pid];
    }
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= k; j++)
        {
            if (stu[i].score[j] != -2)
            {
                if (stu[i].score[j] == fullmark[j])
                {
                    stu[i].flag++;
                }
                stu[i].totalscore += stu[i].score[j];
            }
        }
    }
    sort(stu + 1, stu + n + 1, cmp);
    stu[1].rank = 1;
    for (int i = 2; i <= n; i++)
    {
        if (stu[i].totalscore == stu[i - 1].totalscore)
        {
            stu[i].rank = stu[i - 1].rank;
        }
        else
        {
            stu[i].rank = i;
        }
    }

    for (int i = 1; i <= n; i++)
    {
        if (stu[i].good != 0)
        {
            printf("%d %05d %d ", stu[i].rank, stu[i].usrid, stu[i].totalscore);
            for (int j = 1; j <= k; j++)
            {
                if (stu[i].score[j] != -2)
                {
                    printf("%d", stu[i].score[j]);
                }
                else
                {
                    printf("-");
                }
                if (j == k)
                {
                    printf("\n");
                }
                else
                {
                    printf(" ");
                }
            }
        }
    }

    return 0;
}