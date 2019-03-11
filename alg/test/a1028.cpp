#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
struct Record
{
    int id;
    char name[9];
    int grade;
} stu[100010];
int c;
bool cmp(Record a, Record b)
{
    if (c == 1)
    {
        return (a.id < b.id);
    }
    else if (c == 2)
    {
        if (strcmp(a.name, b.name) != 0)
        {
            return (strcmp(a.name, b.name) < 0);
        }
        else
        {
            return (a.id < b.id);
        }
    }
    else if (c == 3)
    {
        if (a.grade != b.grade)
        {
            return (a.grade < b.grade);
        }
        else
        {
            return (a.id < b.id);
        }
    }else{
        return (a.id < b.id);
    }
}
int main()
{
    freopen("in.dat", "r", stdin);
    freopen("out.dat", "w", stdout);
    int n;
    scanf("%d%d", &n, &c);
    for (int i = 0; i < n; i++)
    {
        scanf("%d %s %d", &stu[i].id, stu[i].name, &stu[i].grade);
    }
    sort(stu, stu + n, cmp);
    for (int i = 0; i < n; i++)
    {
        printf("%06d %s %d\n", stu[i].id, stu[i].name, stu[i].grade);
    }
    return 0;
}