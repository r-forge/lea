\name{fetchOpenlearnUnit}
\alias{fetchOpenlearnUnit}
\title{Openlearn Importer}
\description{
   Fetch the content of an OpenLearn textbook.
}
\usage{
   fetchOpenlearnUnit(url, unit)
}
\arguments{
   \item{url}{The url pointing to the RSS feed of the OpenLearn course unit.}
   \item{unit}{The name of the unit (optional).}
}
\details{

	The Open University provides via OpenLearn a large amount of
	Open Educational Resources (OER) - available free of charge to
	anyone. This importer fetches a full textbook and splits it into
   chapters along the items of the RSS feed provided in OpenLearn.
  
}
\value{
  Returns a vector with a chapter in each element. Minimal cleaning is done.
}
\author{ Fridolin Wild \email{f.wild@open.ac.uk} }
\examples{

texts = fetchOpenlearnUnit("http://openlearn.open.ac.uk/rss/file.php/stdfeed/4417/B716_2_rss.xml")

}
\keyword{rss}
