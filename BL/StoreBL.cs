﻿using DL;

namespace BL;

public class StoreBL : IStoreBL
{
    private readonly IStoreDL _repo;
    public StoreBL(IStoreDL repo)
    {
        _repo = repo;
    }
    public User createNewUser(User userToCreate)
    {
        return _repo.createNewUser(userToCreate);
    }

    public User getUser(User userToGet)
    {
        return _repo.getUser(userToGet);
    }

    public StoreFront addStoreFront(StoreFront storeToAdd)
    {
        return _repo.addStoreFront(storeToAdd);
    }
    public Product addProduct(Product productToAdd)
    {
        return _repo.addProduct(productToAdd);
    }

    public List<Product> GetAllProductByStore(int store)
    {
        return _repo.GetAllProductByStore(store);
    }

    public List<Product> GetAllProduct()
    {
        return _repo.GetAllProduct();
    }
    public Product updateProduct(Product productToUpdate)
    {
        return _repo.updateProduct(productToUpdate);
    }

    public Order placeOrder(Order orderToPlace)
    {
        return _repo.placeOrder(orderToPlace);
    }

    public List<Order> getHistoryOrder(int id)
    {
        return _repo.getHistoryOrder(id);
    }


}
