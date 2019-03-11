#include <cstdio>
#include <vector>
#include <algorithm>
using namespace std;

struct Student
{
    int id;
    int ge, gi, ga;
    int rank;
    int choice[5];
} stu[40010];

struct School
{
    int quota;
    int admit_num;
    int admit[40010];
} sch[110];

bool cmp(Student a, Student b)
{
    if (a.ga != b.ga)
    {
        return (a.ga > b.ga);
    }
    else
    {
        return (a.ge > b.ge);
    }
}
bool cmp2(int a, int b)
{
    return a < b;
}
int main()
{
    freopen("in.dat", "r", stdin);
    freopen("out.dat", "w", stdout);

    int n, m, k;
    scanf("%d%d%d", &n, &m, &k);

    for (int i = 0; i < m; i++)
    {
        scanf("%d", &sch[i].quota);
    }

    for (int i = 0; i < n; i++)
    {
        scanf("%d%d", &stu[i].ge, &stu[i].gi);
        stu[i].ga = stu[i].ge + stu[i].gi;
        for (int j = 0; j < k; j++)
        {
            scanf("%d", &stu[i].choice[j]);
        }
        stu[i].id = i;
    }
    sort(stu, stu + n, cmp);
    stu[0].rank = 1;
    for (int i = 1; i <= n; i++)
    {
        if (stu[i].ga == stu[i - 1].ga && stu[i].ge == stu[i - 1].ge)
        {
            stu[i].rank = stu[i - 1].rank;
        }
        else
        {
            stu[i].rank = i + 1;
        }
    }


    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < k; j++)
        {
            int choice = stu[i].choice[j];
            if (sch[choice].admit_num< sch[choice].quota 
                || (sch[choice].admit_num!=0 && stu[sch[choice].admit[sch[choice].admit_num-1]].rank == stu[i].rank))
            {
                sch[choice].admit[sch[choice].admit_num] = stu[i].id;
                sch[choice].admit_num++;
                break;
            }
        }
    }
    for (int i = 0; i < m; i++)
    {
        sort(sch[i].admit, sch[i].admit+sch[i].admit_num, cmp2);
        for(int j = 0; j < sch[i].admit_num; j++)
        {
            printf("%d", sch[i].admit[j]);
            if(j!=sch[i].admit_num-1){
                printf(" ");
            }
        }
        if (i < m - 1)
        {
            printf("\n");
        }
        
    }

    return 0;
}