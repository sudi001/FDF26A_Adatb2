package main.java.net.adatb2.repository;

import main.java.net.adatb2.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
