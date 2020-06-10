package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import trg.talentsprint.starterkit.model.InterestingPlaces;
import trg.talentsprint.starterkit.model.Routes;

@Repository
public interface RouteRepository extends CrudRepository<Routes, Long> {

	@Query(value = "select * from route where user =?1", nativeQuery = true)
	List<Routes> getroutes(String user);

	@Query(value = "select * from route where fromaddress=?1 or toaddress=?2", nativeQuery = true)
	List<Routes> getdata(String from, String to);

	@Modifying
	@Transactional
	@Query(value = "update route set rating=?2,comment=?3 where id=?1", nativeQuery = true)
	void addrating(long id, int rating, String comment);

	@Query(value = "select * from route where id in (select rid from favourite where username = ?1)", nativeQuery = true)
	Iterable<Routes> findByfavourite(String name);
}
