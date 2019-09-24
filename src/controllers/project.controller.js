import Project from '../models/Project';

export async function getProjects(req, res) {
    try {
        const projects = await Project.findAll();
        res.json({
            data: projects
        })
    } catch (e) {
        console.log(e);
    }
}


export async function createProject(req, res) {
    const { name, priority, description, deliverydate } = await req.body;
    try {
        let newProject = await Project.create({
            name,
            priority,
            description,
            deliverydate
        }, {
            fields: [
                'name',
                'priority',
                'description',
                'deliverydate'
            ]
        });
        if (newProject) {
            return res.json({
                message: 'Project created successfully',
                data: newProject
            });
        }
    } catch (e) {
        console.log(e);
        res.status(500).json({
            message: "Something goes wrong",
            data: {}
        });
    }
}

export async function getOneProject(req, res) {
    try {
        const { id } = await req.params;
        const project = await Project.findOne({
            where: {
                id: id
            }
        })
        res.json({
            data: project
        })
    } catch (e) {
        console.log(e);
    }
}

export async function deleteProject(req, res) {
    try {
        const { id } = await req.params;
        const deleteRowCount = await Project.destroy({
            where: {
                id
            }
        })
        res.json({
            message: 'Project Deleted succesfully',
            count: deleteRowCount
        })
    } catch (e) {
        console.log(e);
    }
}

export async function updateProject(req, res) {
    try {
        const { id } = await req.params;
        const { name, priority, description, deliverydate } = req.body;
        const projects = await Project.findAll({
            attributes: ['id', 'name', 'priority', 'description', 'deliverydate'],
            where: {
                id
            }
        });
        if (projects.length > 0) {
            projects.forEach(
                async project => {
                    await project.update({
                        name,
                        priority,
                        description,
                        deliverydate
                    })
                    return res.json({
                        message: 'Project Updated Sucessfully',
                        data: project
                    })
                }
            )
        }

    } catch (e) {
        console.log(e);
    }
}