#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;

int fee[24];
struct record
{
    char name[21];
    int month, date, hour, minute;
    char state[9];
} cust[1010];

bool cmp(record a, record b)
{
    int tmp;
    if ((tmp = strcmp(a.name, b.name)) != 0)
    {
        return (tmp < 0);
    }
    else if (a.month != b.month)
    {
        return (a.month < b.month);
    }
    else if (a.date != b.date)
    {
        return (a.date < b.date);
    }
    else if (a.hour != b.hour)
    {
        return (a.hour < b.hour);
    }
    else
    {
        return (a.minute < b.minute);
    }
}

void ans(int on, int off, int &time, int &money)
{
    struct record tmp_on = cust[on];
    while (tmp_on.date != cust[off].date || tmp_on.hour != cust[off].hour || tmp_on.minute != cust[off].minute)
    {
        tmp_on.minute++;
        money += fee[tmp_on.hour];
        if (tmp_on.minute == 60)
        {
            tmp_on.minute = 0;
            tmp_on.hour++;
        }
        if (tmp_on.hour == 24)
        {
            tmp_on.hour = 0;
            tmp_on.date++;
        }
        time++;
    }
    return;
}

int main()
{
    //freopen("in.dat", "r", stdin);
    //freopen("out.dat", "w", stdout);
    for (int i = 0; i < 24; i++)
    {
        scanf("%d", &fee[i]);
    }
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%s %d:%d:%d:%d %s", cust[i].name, &cust[i].month, &cust[i].date, &cust[i].hour, &cust[i].minute, cust[i].state);
    }
    sort(cust, cust + n, cmp);
    int on = 0, off, next;
    while (on < n)
    {
        int needprint = 0;
        next = on;
        while (next < n && strcmp(cust[on].name, cust[next].name) == 0)
        {
            if (strcmp(cust[next].state, "on-line") == 0 && needprint == 0)
            {
                needprint = 1;
            }
            else if (strcmp(cust[next].state, "off-line") == 0 && needprint == 1)
            {
                needprint = 2;
            }
            next++;
        }
        if (needprint < 2)
        {
            on = next;
            continue;
        }
        printf("%s %02d\n", cust[on].name, cust[on].month);
        int total = 0;
        while (on < next)
        {
            while (on < next - 1 && (strcmp(cust[on].state, "on-line") != 0 || strcmp(cust[on + 1].state, "off-line") != 0))
            {
                on++;
            }
            off = on + 1;
            if(off==next){
                on = next;
                break;
            }//这个判断是因为next代表下一位用户，off如果指到下一位用户就不对了
            printf("%02d:%02d:%02d ", cust[on].date, cust[on].hour, cust[on].minute);
            printf("%02d:%02d:%02d ", cust[off].date, cust[off].hour, cust[off].minute);
            int time = 0, money = 0;
            ans(on, off, time, money);
            printf("%d $%.2f\n", time, money / 100.0);
            total += money;
            on = off + 1;
        }
        printf("Total amount: $%.2f\n", total / 100.0);
    }

    return 0;
}
