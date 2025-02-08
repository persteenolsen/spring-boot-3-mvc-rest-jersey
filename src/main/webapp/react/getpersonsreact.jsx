
class GetPersons extends React.Component {

    constructor(props) {

        super(props)

        this.state = {
            persons: []

        };

    }

    componentDidMount() {

        // Getting the data from the DB by the Jersey Web API
         fetch('jax-rs/person-jersey/persons')
        .then(response => response.json())
        .then(data => { this.setState({ persons: data }) })

        //.catch(error => console.log('error fetching', error))

        // Note: Using for testing locally as an alternative to the data at the DB
        // this.setState({ persons: [ { "id": 8, "name": "Ole", "email": "ole@test.dk", "age": "46" }, { "id": 10, "name": "Lars", "email": "lars@test.dk", "age": "33" }] });


    }


    render() {

        return (
           
            <div>
             <table id="persons" width="250">
                             
               <tbody>
               <tr><td><b>Name</b></td><td><b>Email</b></td><td><b>Age</b></td></tr>
                                    
                   {this.state.persons.map((person, i) => <TableRow key = {i} 
                     persons = {person} />)}

               </tbody>
            </table>
            </div>

        );
    }


}

class TableRow extends React.Component {
   render() {
      return (
         <tr>
            
            <td>{this.props.persons.name}</td>
            <td>{this.props.persons.email}</td>
            <td>{this.props.persons.age}</td>
         </tr>
      );
   }
}

ReactDOM.render(
    <GetPersons />,
    document.getElementById('rootapi')
);
