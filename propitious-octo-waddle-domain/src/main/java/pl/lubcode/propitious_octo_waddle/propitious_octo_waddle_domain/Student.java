package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Set;

public interface Student extends Person {
	Set<Assessment> getAssessments ( );
}
