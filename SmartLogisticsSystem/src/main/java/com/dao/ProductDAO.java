package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Product;

@Repository
public class ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(Product product) {
        sessionFactory.getCurrentSession().save(product);
    }

    public List<Product> getAll() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Product", Product.class)
                .list();
    }

    public Product getById(int id) {
        return sessionFactory.getCurrentSession().get(Product.class, id);
    }

 
    public List<Product> searchProduct(String keyword) {
        return sessionFactory.getCurrentSession()
            .createQuery("from Product where lower(name) like :key "
                    + "or lower(brand) like :key "
                    + "or lower(category) like :key", Product.class)
            .setParameter("key", "%" + keyword.toLowerCase() + "%")
            .list();
    }

    
    public List<Product> filterByPrice(double min, double max) {
        return sessionFactory.getCurrentSession()
            .createQuery("from Product where price between :min and :max", Product.class)
            .setParameter("min", min)
            .setParameter("max", max)
            .list();
    }

   
    public List<Product> filterByCategory(String category) {
        return sessionFactory.getCurrentSession()
            .createQuery("from Product where category=:cat", Product.class)
            .setParameter("cat", category)
            .list();
    }

   
    public List<Product> sortByPrice(String order) {
        String hql = "from Product order by price " + order;
        return sessionFactory.getCurrentSession()
            .createQuery(hql, Product.class)
            .list();
    }
    
    public List<Product> filterProducts(String[] category, Double minPrice, Double maxPrice, Boolean inStock) {

        String hql = "from Product where 1=1";

        if (category != null) {
            hql += " and category in (:category)";
        }

        if (minPrice != null) {
            hql += " and price >= :minPrice";
        }

        if (maxPrice != null) {
            hql += " and price <= :maxPrice";
        }

        if (inStock != null && inStock) {
            hql += " and quantity > 0";
        }

        Query<Product> query = sessionFactory.getCurrentSession().createQuery(hql, Product.class);

        if (category != null) {
            query.setParameterList("category", category);
        }

        if (minPrice != null) {
            query.setParameter("minPrice", minPrice);
        }

        if (maxPrice != null) {
            query.setParameter("maxPrice", maxPrice);
        }

        return query.list();
    }
    
    public List<Product> sortProducts(String sort) {

        String hql = "from Product";

        if (sort.equals("low")) {
            hql += " order by price asc";
        } else if (sort.equals("high")) {
            hql += " order by price desc";
        }

        return sessionFactory.getCurrentSession()
                .createQuery(hql, Product.class)
                .list();
    }

	public Product findById(int productId) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().get(Product.class, productId);
	}

	public void update(Product product) {
		// TODO Auto-generated method stub
		 Session session = sessionFactory.getCurrentSession();
	        session.update(product);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();

        Product product = session.get(Product.class, id);

        if (product != null) {
            session.delete(product);
        }
	}

	
}