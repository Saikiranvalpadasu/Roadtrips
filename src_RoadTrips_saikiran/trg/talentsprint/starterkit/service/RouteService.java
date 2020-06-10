package trg.talentsprint.starterkit.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import trg.talentsprint.starterkit.model.InterestingPlaces;
import trg.talentsprint.starterkit.model.Routes;
import trg.talentsprint.starterkit.repository.IplaceRepository;
import trg.talentsprint.starterkit.repository.RouteRepository;

@Service
public class RouteService {
	@Autowired
	private RouteRepository repository;

	@Autowired
	private IplaceRepository irepository;

	public List<Routes> getAllRoutesbyuser(String user) {
		List<Routes> rlist = new ArrayList<>();
		repository.getroutes(user).forEach(rlist::add);
		return rlist;
	}
	public List<Routes> getAllRoutes() {
		List<Routes> rlist = new ArrayList<>();
		repository.findAll().forEach(rlist::add);
		return rlist;
	}

	public Optional<Routes> getRouteById(long id) {
		return repository.findById(id);
	}
	public void addrating(long id, int rating,String comment) {
		repository.addrating(id,rating,comment);
		
	}

	public Routes addRoute(Routes route) {
		return repository.save(route);
	}

	public InterestingPlaces addIplace(InterestingPlaces iplace) {
		return irepository.save(iplace);

	}

	public Optional<InterestingPlaces> getIplaceById(int id) {
		return irepository.findById(id);
	}

	public List<InterestingPlaces> getIplaces(long id) {
		List<InterestingPlaces> ilist = irepository.getIplace(id);
		return ilist;
	}
	public List<Routes> getMyFavouriteRoute(String name){
		List<Routes> rlist = new ArrayList<>();
		repository.findByfavourite(name).forEach(rlist::add);
		return rlist;
	}

	public void deleteById(Long id) {
		repository.deleteById(id);
	}

	public void deleteinterstingpbyId(Long rid) {
		irepository.deleteintrestingplacebyid(rid);
	}

	public void deleteiplace(int id) {
		irepository.deleteById(id);
	}

	public long findroutedetails(int id) {
		return irepository.getrid(id);
	}
	public List<Routes> finddaata(String from, String to) {		
		return repository.getdata(from, to);
	}



}
