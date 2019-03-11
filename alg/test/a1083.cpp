#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;

struct STUDENT
{
    char name[11];
    char ID[11];
    int grade;
} stu[10010];

bool cmp(STUDENT a, STUDENT b)
{
    return (a.grade > b.grade);
}
int main()
{
    //freopen("in.dat", "r", stdin);
    //freopen("out.dat", "w", stdout);
    int n, grade1, grade2;
    scanf("%d", &n);
    for(int i = 0; i < n; i++)
    {
        scanf("%s %s %d", stu[i].name, stu[i].ID, &stu[i].grade);
    }
    scanf("%d%d", &grade1, &grade2);
    sort(stu, stu + n, cmp);
    int flag = 0;
    for(int i = 0; i < n; i++)
    {
        if (stu[i].grade>=grade1&&stu[i].grade<=grade2) {
            printf("%s %s\n", stu[i].name, stu[i].ID);
            flag = 1;
        }
        
    }
    if(flag==0){
        printf("NONE\n");
    }

    return 0;
}