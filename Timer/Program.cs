namespace Timer
{
    internal class Program
    {
        static void Main(string[] args)
        {
            for (int l = 0; l < 24; l++)
            {
                for (int m = 0; m < 60; m++)
                {
                    for (int k = 0; k < 60; k++)
                    {
                        for (int i = 0; i < 1000; i++)
                        {
                            for (int j = 0; j < 3796032; j++)
                            {
                                if (j == 3796032 - 1 && i == 999)
                                {
                                    if (l < 10 && m < 10 && k < 10)
                                    {
                                        Console.WriteLine("0" + l + ":0" + m + ":0" + k);
                                    }
                                    else if (l < 10 && m < 10 && k >= 10)
                                    {
                                        Console.WriteLine("0" + l + ":0" + m + ":" + k);
                                    }
                                    else if (l < 10 && m >= 10 && k >= 10)
                                    {
                                        Console.WriteLine("0" + l + ":" + m + ":" + k);
                                    }
                                    else if (l >= 10 && m < 10 && k >= 10)
                                    {
                                        Console.WriteLine(l + ":0" + m + ":" + k);
                                    }
                                    else if (l < 10 && m >= 10 && k < 10)
                                    {
                                        Console.WriteLine("0" + l + ":" + m + ":0" + k);
                                    }
                                    else if (l >= 10 && m < 10 && k < 10)
                                    {
                                        Console.WriteLine(l + ":0" + m + ":0" + k);
                                    }
                                    else if (l >= 10 && m >= 10 && k < 10)
                                    {
                                        Console.WriteLine(l + ":" + m + ":0" + k);
                                    }
                                    else
                                    {
                                        Console.WriteLine(l + ":" + m + ":" + k);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
