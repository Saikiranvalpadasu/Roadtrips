package trg.talentsprint.starterkit.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import trg.talentsprint.starterkit.model.InterestingPlaces;

@Repository
public interface IplaceRepository extends CrudRepository<InterestingPlaces,Integer>{	
	@Query(value = "select * from interesting_places where rid =?1", nativeQuery = true)
	List<InterestingPlaces> getIplace(Long rid);
	
	@Modifying
	@Transactional
	@Query(value = "delete from interesting_places where rid=?1", nativeQuery = true)
	void deleteintrestingplacebyid(@Param("rid") long rid);
	
	@Query(value = "select rid from interesting_places where id =?1", nativeQuery = true)
	long getrid(int id);

}
