#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
struct Record
{
    char name[9];
    int age;
    int worth;
} billionaires[100010];
bool cmp(Record a, Record b)
{
    if(a.worth!=b.worth){
        return (a.worth > b.worth);
    }else if (a.age!=b.age) {
        return (a.age < b.age);
    }else {
        return (strcmp(a.name, b.name) < 0);
    }
}
int main()
{
    //freopen("in.dat", "r", stdin);
    //freopen("out.dat", "w", stdout);
    int n, k;
    scanf("%d%d", &n, &k);
    for(int i = 0; i < n; i++)
    {
        scanf("%s %d %d", billionaires[i].name, &billionaires[i].age, &billionaires[i].worth);
    }
    int m, agemin, agemax;
    sort(billionaires, billionaires + n, cmp);
    for(int i = 0; i < k; i++)
    {
        scanf("%d%d%d", &m, &agemin, &agemax);
        printf("Case #%d:\n", i+1);//看清输出
        int flag = 0;
        for(int j = 0; j < n; j++)
        {
            if (billionaires[j].age>=agemin&&billionaires[j].age<=agemax) {
                printf("%s %d %d\n", billionaires[j].name, billionaires[j].age, billionaires[j].worth);
                flag++;
            }
            if (flag>=m) {
                break;
            }
        }
        if (flag==0) {
            printf("None\n");
        }
        
    }
    

    return 0;
}