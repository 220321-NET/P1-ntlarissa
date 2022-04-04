using System.ComponentModel.DataAnnotations;
using Models;
using BL;

namespace UI;

public class MainMenu
{
    private readonly IStoreBL _bl;

    //Dependency injection
    public MainMenu(IStoreBL bl)
    {
        _bl = bl;
    }

    public void Start()
    {
        HomePage();
    }
    public void HomePage()
    {
        Console.WriteLine("Welcome to Store App");
        bool exit = false;
        do
        {

            Console.WriteLine("Are you a customer or a manager?");
            Console.WriteLine("[1] Customer");
            Console.WriteLine("[2] Manager");
            Console.WriteLine("[x] Exit");
            string input = InputValidation.validString();

            switch (input.ToLower())
            {
                case "1":
                    //customer portal
                    new CustomerMenu(_bl).Start();
                    break;

                case "2":
                    //Manager view
                    new ManagerMenu(_bl).Start();
                    break;
                case "x":
                    Console.WriteLine("Goodbye!");
                    exit = true;
                    break;

                default:
                    Console.WriteLine("Invalid input, try again");
                    break;
            }

        } while (!exit);

    }
}
