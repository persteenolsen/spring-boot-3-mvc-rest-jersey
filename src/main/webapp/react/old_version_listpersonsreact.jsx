
/*class GetPersonsList extends React.Component {

    constructor(props) {

        super(props);

        this.state = {
            persons: []

        };

      // this.deletePerson = this.deletePerson.bind(this);

    }

    componentDidMount() {

        // Getting the data from the DB by the Jersey Web API
         fetch('jax-rs/person-jersey/persons')
        .then(response => response.json())
        .then(data => { this.setState({ persons: data }) })

        // Note: Using for testing locally as an alternative to the data at the DB
        // this.setState({ persons: [ { "id": 8, "name": "Ole", "email": "ole@test.dk", "age": "46" }, { "id": 10, "name": "Lars", "email": "lars@test.dk", "age": "33" }] });

    }


    render() {

        return (
           
            <div>
                
             <a href="/clientrestreactcreate" target="_top">Create a new Person</a>
             <br/> <br/>    

             <table id="persons">
       
               <tbody>
                  <tr><td><b>Name</b></td><td><b>Email</b></td><td><b>Age</b></td><td></td></tr>
                                    
                   {this.state.persons.map((person, i) => 
                   <TableRow key = {i} persons = {person} />)}
                                    
               </tbody>
            </table>
            </div>

        )
    } 

}


class TableRow extends React.Component {
   render() {
      return (
         <tr>
                                  
            <td>{this.props.persons.name}</td>
            <td>{this.props.persons.email}</td>
            <td>{this.props.persons.age}</td>

            <td>
                         
                <button className="react-button-edit" onClick={this.editPerson.bind(this, this.props.persons.id)}>Edit</button>
                <button className="react-button-delete" onClick={this.deletePerson.bind(this, this.props.persons.id)}>Delete</button>
        
            </td>
                      
          </tr>
      )
   }
   
   
   editPerson(idedit){
     
       //alert("Selected Person: " + idedit);
       
        // Note: The user is redirected to the admin list of Persons
        window.location.href = "/clientrestreactedit?id=" + idedit;
   }
   
   deletePerson(id)  {
 
     if(window.confirm("Are you sure want to delete the Person?")) {
         
         fetch('jax-rs/person-jersey/person/' + id, {
             method : 'DELETE'
         }).then(response => { 
                 
                 // On Success the server will most likely return 204 because no content to return
                 if( response.status == 200  || response.status == 204 ) {
                     alert("The Person was deleted successfully");
                     
                    // NOTE: Reload / update the cached version (false) of the page !!
                     window.location.reload(false);
                  
                     // NOTE: It is not updating the GUI when called here !!!
                     // Getting the data from the DB by the Jersey Web API
                     // fetch('jax-rs/person-jersey/persons')
                    //  .then(response => response.json())
                    //  .then(data => { this.setState({ persons: data }) })
                   
                 } 
          })
       }
         
     }
 
  }



ReactDOM.render(
    <GetPersonsList />,
    document.getElementById('rootapi')
);
*/