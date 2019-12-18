int main()
{
    int x;

    scanf("%d",&x);

    for(int i=0;i<4;i++)
    {
        for(int j=i;j<x;j++)
        {
             printf("j= %d",j);
        }
        
    }

    return 0 ;
}
