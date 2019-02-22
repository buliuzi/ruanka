# �㷨�ʼǼ�¼

## ��ʱ��¼��һЩ

scanf��gets�����ڽ����ַ���ʱ��

1.��ͬ�㣺
scanf���ܽ��ܿո��Ʊ��Tab���س��ȣ���ĩβ�س����Ĵ����ѻس��������ڻ����С�
��gets�ܹ����ܿո��Ʊ��Tab�ͻس��ȣ���ĩβ�س����Ĵ������ջس������ѻس��滻Ϊ\0.

2.��ͬ�㣺
�ַ������ܽ������Զ���'\0'��

## ����ģ��

- **���ڴ���**

<img src="./image/dateprocess.png" height="70%" width="70%" >

```cpp
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
#include <cstdio>
using namespace std;
int month[12][2] = {{31, 31}, {28, 29}, {31, 31}, {30, 30}, {31, 31}, {30, 30}, 
                    {31, 31}, {31, 31}, {30, 30}, {31, 31}, {30, 30}, {31, 31}};
bool isLeap(int year)
{
    return ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0));
}
int main(int argc, char const *argv[])
{
    freopen("in.dat", "r", stdin);
    int date1, date2;
    int y1, y2;
    int m1, m2;
    int d1, d2;
    while (scanf("%d%d", &date1, &date2) != EOF)
    {
        if (date1 > date2)
        {
            int tmp = date1;
            date1 = date2;
            date2 = tmp;
        }
        y1 = date1 / 10000;
        y2 = date2 / 10000;
        /*m1=(date1-y1*10000)/100;
        m2=(date2-y2*10000)/100;
        d1=date1-y1*10000-m1*100;
        d2=date2-y2*10000-m2*100;*/
        //ע������Ĵ���ʽ
        m1 = (date1 % 10000) / 100;
        m2 = (date2 % 10000) / 100;
        d1 = date1 % 100;
        d2 = date2 % 100;
        int ans = 1;
        while (y1 < y2 || m1 < m2 || d1 < d2)
        {
            d1++;
            if (d1 == month[m1 - 1][isLeap(y1)] + 1)
            {
                m1++;
                d1 = 1;
            }
            if (m1 == 13)
            {
                y1++;
                m1 = 1;
            }
            ans++;
        }
        printf("%d", ans);
    }
    return 0;
}

```

˼·�ܽ᣺��������ʹ��ѭ����һ�����������·ݵ������ö�ά��������

- **����ת��**

```cpp
//��һ��P������xת��Ϊʮ������y
int y=0,product=1;
while(x!=0){
    y+=(x%10)*product;
    x/=10;
    product*=P;
}
//��һ��ʮ������yת��ΪQ������z
int z[40],num=0;
do{
    z[num++]=y%Q;
    y/=Q;
}while(y!=0);
```

- **˵����**

<img src="./image/reverse.png" height="70%" width="70%" >

```cpp
#include <cstdio>
#include <cstring>
using namespace std;
const int maxn = 81;
char ans[maxn][maxn];
char str[maxn];

int main(int argc, char const *argv[])
{
    freopen("in.dat", "r", stdin);
    gets(str);
    int len = strlen(str), line = 0, col = 0;
    for (int i = 0; i < len; i++)
    {
        if (str[i] != ' ')
        {
            ans[line][col++] = str[i];
        }
        else
        {
            ans[line][col] = '\0';
            line++;
            col = 0;
        }
    }
    for (int i = line; i >= 0; i--)
    {
        printf("%s", ans[i]);
        if (i > 0)
            printf(" ");
    }
    //�����Ǹ����İ취
    /*int num = 0;
    while (scanf("%s", str[num++]) != EOF)
        ;
    num -= 2;
    do
    {
        printf("%s", str[num--]);
        if (num >= 0)
        {
            printf(" ");
        }
    } while (num >= 0);*/

    return 0;
}

```

## �㷨����

���������������㷨

```cpp
int A[maxn],n;
void selectSort()//ѡ������
{
    for (int i = 0; i < n; i++)
    {
        int k = i;
        for (int j = i; j < n; j++) //��¼i��n-1��С��Ԫ��
        {
            if (A[j] < A[k])
            {
                k = j;
            }
        }
        int tmp = A[i];
        A[i] = A[k];
        A[k] = tmp;
    }
}
void insertSort()//��������
{
    for (int i = 1; i < n; i++)
    {
        int tmp = A[i], j = i;
        while (j > 0 && tmp < A[j - 1])
        {
            A[j] = A[j - 1];
            j--;
        }
        A[j] = tmp;
    }
}
```

- **PAT Ranking**

�����˼·һ��ʼû������ã���Ҫ�ิϰ

<img src="./image/PATRanking1.png" height="70%" width="70%" >
<img src="./image/PATRanking2.png" height="70%" width="70%" >

```cpp
#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
struct STUDENT
{
    char num[14]; //ID
    int lnum;     //������
    int grade;    //����
    //int frank;//������  //���������һ���������
    int lrank; //��������
} stu[30000];
bool cmp(STUDENT a, STUDENT b)
{
    if (a.grade != b.grade)
        return (a.grade > b.grade); //nondecreasing
    else
        return (strcmp(a.num, b.num) < 0);
}
int main(int argc, char const *argv[])
{
    freopen("in.dat", "r", stdin);
    int n, id = 0;
    scanf("%d", &n);
    for (int i = 1; i <= n; i++)
    {
        int tmp;
        scanf("%d", &tmp);
        for (int j = 0; j < tmp; j++)
        {
            scanf("%s %d", stu[id].num, &stu[id].grade);
            stu[id++].lnum = i;
        }
        sort(stu + id - tmp, stu + id, cmp); //ע������Ĵ���
        stu[id - tmp].lrank = 1;
        for (int k = id - tmp + 1; k < id; k++)
        {
            if (stu[k].grade == stu[k - 1].grade)
            {
                stu[k].lrank = stu[k - 1].lrank;
            }
            else
            {
                stu[k].lrank = k + 1 - (id - tmp);
            }
        }
    }

    sort(stu, stu + id, cmp);
    int r = 1;
    printf("%d\n", id);
    for (int i = 0; i < id; i++)
    {
        if (i > 0 && stu[i].grade != stu[i - 1].grade)
        {
            r = i + 1;
        }
        printf("%s %d %d %d", stu[i].num, r, stu[i].lnum, stu[i].lrank);
        if (i != id - 1)
            printf("\n");
    }
    return 0;
}

```

- **hash��**
```cpp
#include <cstdio>
using namespace std;
char S[maxn][4], tmp[4];
int hashTable[26 * 26 * 26];
int hashFunc(char S[], int len)
{
    int id = 0;
    for (int i = 0; i < len; i++)
    {
        id = id * 26 + S[i] - 'A';
    }
    return id;
}
int main(int argc, char const *argv[])
{
    freopen("in.dat", "r", stdin);
    int n, m;
    scanf("%d%d", &n, &m);
    for (int i = 0; i < n; i++)
    {
        scanf("%s", S[i]);
        int id = hashFunc(S[i], 3);
        hashTable[id]++;
    }
    for (int i = 0; i < m; i++)
    {
        scanf("%s", tmp);
        int id = hashFunc(tmp, 3);
        printf("%d\n", hashTable[id]);
    }
    return 0;
}
```

- **�ֵ���ȫ����**
```cpp
#include <cstdio>
//#include <cstring>
//#include <algorithm>
using namespace std;
const int maxn = 11;
int P[maxn], hashTable[maxn];
int n;
void func(int index) //������׼����P[index]
{
    if (index == n + 1) //�ڱ߽�
    {
        for (int i = 1; i <= n; i++)
        {
            printf("%d", P[i]);
        }
        printf("\n");
        return;
    }
    for (int i = 1; i <= n; i++) //��1��n��������
    {
        if (hashTable[i] == false)
        {
            P[index] = i;
            hashTable[i] = true;
            func(index + 1);
            hashTable[i] = false;
        }
    }
}
int main(int argc, char const *argv[])
{
    freopen("in.dat", "r", stdin);
    n = 3;
    func(1);
    return 0;
}
```

- **�˻ʺ�ı������ͻ��ݷ�**

```cpp
#include <cstdio>
#include <cmath>
//#include <cstring>
//#include <algorithm>
using namespace std;
const int maxn = 11;
int P[maxn], hashTable[maxn];
int n, count;
void generateP1(int index)
{
    if (index == n + 1)
    {
        bool flag = true;
        for (int i = 1; i <= n; i++)
        {
            for (int j = i + 1; j <= n; j++)
            {
                if (abs(i - j) == abs(P[i] - P[j]))
                {
                    flag = false;
                }
            }
        }
        if (flag)
        {
            count++;
        }
    }
    for (int i = 1; i <= n; i++)
    {
        if (hashTable[i] == false)
        {
            P[index] = i;
            hashTable[i] = true;
            generateP1(index + 1);
            hashTable[i] = false;
        }
    }
}
void generateP2(int index)
{
    if (index == n + 1)
    {
        count++;
        return;
    }
    for (int i = 1; i <= n; i++)
    {
        if (hashTable[i] == false)
        {
            bool flag = true;
            for (int pre = 1; pre <= index - 1; pre++)
            {
                if (abs(index - pre) == abs(i - P[pre]))
                {
                    flag = false;
                    break;
                }
            }
            if (flag)
            {
                P[index] = i;
                hashTable[i] = true;
                generateP2(index + 1);
                hashTable[i] = false;
            }
        }
    }
}
int main(int argc, char const *argv[])
{
    freopen("in.dat", "r", stdin);
    n = 8;
    count = 0;
    generateP1(1);
    printf("%d", count);
    count = 0;
    generateP2(1);
    printf("%d", count);
    return 0;
}
```

- **̰��**

���±�

<img src="./image/mooncake1.png" height="70%" width="70%" >
<img src="./image/mooncake2.png" height="70%" width="70%" >

```cpp
#include <cstdio>
//#include <cmath>
//#include <cstring>
#include <algorithm>
using namespace std;
const int maxn = 1010;

struct mooncake
{
    double store;
    double sell;
    double price;
} cake[maxn];
bool cmp(mooncake a, mooncake b)
{
    return (a.price > b.price);
}

int main(int argc, char const *argv[])
{
    freopen("in.dat", "r", stdin);
    int n;
    double D;
    scanf("%d%lf", &n, &D);
    int store[maxn], sell[maxn];
    for (int i = 0; i < n; i++)
    {
        scanf("%lf", &cake[i].store);
    }
    for (int i = 0; i < n; i++)
    {
        scanf("%lf", &cake[i].sell);
        cake[i].price = cake[i].sell / cake[i].store;
    }
    sort(cake, cake + n, cmp);
    double ans = 0;
    for (int i = 0; i < n; i++)
    {
        if (cake[i].store <= D)
        {
            D -= cake[i].store;
            ans += cake[i].sell;
        }
        else
        {
            ans += cake[i].price * D;
            break;
        }
    }
    printf("%.2f\n", ans);

    return 0;
}
```

- **����̰�ģ��ѡ��**

������N�����ѡ�����⣨���䲻�ཻ��

```cpp
#include <cstdio>
//#include <cstring>
//#include <cmath>
#include <algorithm>
using namespace std;
const int maxn = 110;
struct Inteval
{
    int x, y;
} I[maxn];

bool cmp(Inteval a, Inteval b)
{
    if (a.x != b.x)
        return (a.x > b.x);
    else
        return (a.y < b.y);
}

int main(int argc, char const *argsv[])
{
    //freopen("in.dat", "r", stdin);
    int N;
    while (scanf("%d", &N), N != 0) //���ű��ʽȡ���ں����ֵ
    {
        for (int i = 0; i < N; i++)
        {
            scanf("%d%d", &I[i].x, &I[i].y);
        }
        sort(I, I + N, cmp);
        int ans = 1, lastX = I[0].x;
        for (int i = 1; i < N; i++)
        {
            if (I[i].y <= lastX)
            {
                lastX = I[i].x;
                ans++;
            }
        }
        printf("%d\n", ans);
    }
    return 0;
}

```

����ѡ������䲻�ཻ�����������`if (I[i].y <= lastX)`��Ϊ`if (I[i].y < lastX)`��
��Ϊ����ѡ�㣨�ڰ���˵�Ӵ�С�����������£�ÿ�ζ�Ҫѡ��˵㣬
������˵����һ������������Ҷ˵�Ͳ����غϣ��غϾ�������������һ�������ĵ��ˣ�

- һ��Ķ��ֲ���
```cpp
int binarySearch(int A[], int left, int right, int x)
{
    int mid;
    while (left <= right)/////////////
    {
        mid = (left + right) / 2;
        if (A[mid] == x)
        {
            return mid;
        }
        else if (A[mid] < x)
        {
            left = mid + 1;
        }
        else
        {
            right = mid - 1;
        }
    }
    return -1;
}
```

- �ҵ�һ������������Ԫ��
```cpp
int lower_bound(int A[], int left, int right, int x)
{
    int mid;
    while (left < right)////////////////
    {
        mid = (left + right) / 2;
        if (A[mid] >= x)
        {
            right = mid;
        }
        else
        {
            left = mid + 1;
        }
    }
    return left;
}
int upper_bound(int A[], int left, int right, int x)
{
    int mid;
    while (left < right)////////////////
    {
        mid = (left + right) / 2;
        if (A[mid] > x)
        {
            right = mid;
        }
        else
        {
            left = mid + 1;
        }
    }
    return left;
}
int solve(int A[], int left, int right, int x)//����ģ�壡
{
    int mid;
    while (left < right)////////////////
    {
        mid = (left + right) / 2;
        if ("��������")//��һ������������Ԫ�ص�λ��<=mid
        {
            right = mid;
        }
        else
        {
            left = mid + 1;
        }
    }
    return left;
}
```

- ���ַ���չ

�������f(x)=0��������

```cpp
const int eps = 1e-5;

double f(double x)
{
    return ...;
}
double solve(double L, double R)
{
    double left = L, right = R, mid;
    while (right - left > eps)
    {
        mid = (left + right) / 2;
        if (f(mid) > 0)
        {
            right = mid;
        }
        else
        {
            left = mid;
        }
    }
    return mid;
}
```

װˮ����

<img src="./image/loadwater.png" height="70%" width="70%" >

```cpp
#include <cstdio>
#include <cmath>
using namespace std;
const double PI = acos(-1);
const double eps = 1e-5;

double f(double R, double h)
{
	double alpha = 2 * acos((R - h) / R);
	double L = 2 * sqrt(R*R - (R - h)*(R - h));
	double s2 = PI * R*R / 2;
	double s1 = alpha * R*R / 2 - L * (R - h) / 2;
	return s1 / s2;
}

double solve(double R, double r)
{
	double left = 0, right = R, mid;
	while (right - left > eps)
	{
		mid = (left + right) / 2;
		if (f(R, mid) > r)
		{
			right = mid;
		}
		else {
			left = mid;
		}
	}
	return mid;
}

int main()
{
	freopen("in.dat", "r", stdin);
	double R, r;
	scanf("%lf%lf", &R, &r);
	printf("%.4f\n", solve(R, r));
	return 0;
}
```